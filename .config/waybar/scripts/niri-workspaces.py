#!/usr/bin/env python3

from json import dumps, loads, JSONDecodeError
from subprocess import Popen, PIPE, TimeoutExpired
from sys import exit

ICON_ACTIVE = ""
ICON_INACTIVE = ""
ICON_OTHER = "•"

COLOR_FOCUSED = "#7aa2f7"
COLOR_UNFOCUSED = "#565f89"


class State:
    __slots__ = ("workspaces", "windows")

    workspaces: dict[int, dict]
    windows: dict[int, dict]

    def __init__(self) -> None:
        self.workspaces = {}
        self.windows = {}

    def apply(self, event: dict) -> None:
        for kind, data in event.items():
            handler = HANDLERS.get(kind)

            if handler is not None:
                handler(self, data)


def _workspaces_changed(state: State, data: dict) -> None:
    state.workspaces = {ws["id"]: ws for ws in data["workspaces"]}

    live = state.workspaces
    state.windows = {
        wid: w for wid, w in state.windows.items() if w.get("workspace_id") in live
    }


def _workspace_activated(state: State, data: dict) -> None:
    target = state.workspaces.get(data["id"])

    if target is None:
        return

    output = target.get("output")
    focused = data.get("focused", False)

    for ws in state.workspaces.values():
        is_target = ws["id"] == target["id"]
        if ws.get("output") == output:
            ws["is_active"] = is_target
        if focused:
            ws["is_focused"] = is_target


def _workspace_active_window_changed(state: State, data: dict) -> None:
    ws = state.workspaces.get(data["workspace_id"])
    if ws is not None:
        ws["active_window_id"] = data.get("active_window_id")


def _windows_changed(state: State, data: dict) -> None:
    state.windows = {w["id"]: w for w in data["windows"]}


def _window_opened_or_changed(state: State, data: dict) -> None:
    window = data["window"]
    state.windows[window["id"]] = window

    if window.get("is_focused"):
        _set_focused_window(state, window["id"])


def _window_closed(state: State, data: dict) -> None:
    state.windows.pop(data["id"], None)


def _window_focus_changed(state: State, data: dict) -> None:
    _set_focused_window(state, data.get("id"))


def _window_layouts_changed(state: State, data: dict) -> None:
    for window_id, layout in data["changes"]:
        window = state.windows.get(window_id)

        if window is not None:
            window["layout"] = layout


def _set_focused_window(state: State, window_id: int | None) -> None:
    for wid, window in state.windows.items():
        window["is_focused"] = wid == window_id


HANDLERS = {
    "WorkspacesChanged": _workspaces_changed,
    "WorkspaceActivated": _workspace_activated,
    "WorkspaceActiveWindowChanged": _workspace_active_window_changed,
    "WindowsChanged": _windows_changed,
    "WindowOpenedOrChanged": _window_opened_or_changed,
    "WindowClosed": _window_closed,
    "WindowFocusChanged": _window_focus_changed,
    "WindowLayoutsChanged": _window_layouts_changed,
}


def window_sort_key(window: dict) -> tuple:
    layout = window.get("layout") or {}
    pos = layout.get("pos_in_scrolling_layout")

    if pos is not None:
        return (0, pos[0], pos[1])

    view_pos = layout.get("tile_pos_in_workspace_view")

    if view_pos is not None:
        return (1, view_pos[0], view_pos[1])

    return (2, window["id"], 0)


def workspace_sort_key(workspace: dict) -> tuple:
    return (workspace.get("output") or "", workspace.get("idx", 0))


def render(state: State) -> str:
    by_workspace: dict[int, list[dict]] = {}

    for window in state.windows.values():
        by_workspace.setdefault(window.get("workspace_id"), []).append(window)

    parts = []

    for workspace in sorted(state.workspaces.values(), key=workspace_sort_key):
        windows = by_workspace.get(workspace["id"])
        focused = workspace.get("is_focused", False)

        if focused:
            icons = " ".join(
                ICON_ACTIVE if w.get("is_focused") else ICON_INACTIVE
                for w in sorted(windows or (), key=window_sort_key)
            )
        else:
            icons = " ".join([ICON_OTHER] * len(windows or ()))

        color = COLOR_FOCUSED if focused else COLOR_UNFOCUSED
        parts.append(f"<span foreground='{color}'>{icons}</span>")

    return " ".join(parts)


def main() -> int:
    state = State()
    last = None

    proc = Popen(
        ["niri", "msg", "--json", "event-stream"],
        stdout=PIPE,
        text=True,
        bufsize=1,
    )

    try:
        for line in proc.stdout:
            line = line.strip()

            if not line:
                continue
            try:
                event = loads(line)
            except JSONDecodeError:
                continue

            state.apply(event)

            text = render(state)

            if text != last:
                last = text
                print(dumps({"text": text}), flush=True)
    except (KeyboardInterrupt, BrokenPipeError):
        pass
    finally:
        proc.terminate()
        try:
            proc.wait(timeout=2)
        except TimeoutExpired:
            proc.kill()

    return proc.returncode or 0


if __name__ == "__main__":
    exit(main())
