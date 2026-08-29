-- Commands
local commands = require("commands/commands")

local mainMod = "SUPER"

-- Basic
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(commands.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F4", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(commands.fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(commands.browser))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(commands.lock))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(commands.power))
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd(commands.menu))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(commands.terminal)) -- For the normies

-- Printing
hl.bind("PRINT", hl.dsp.exec_cmd(commands.print_screen))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(commands.print_window))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(commands.print_region))

-- Change focus between windows
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move through workspaces
hl.bind(mainMod .. " + ALT + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.focus({ workspace = "+1" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Go to the previous workspace (for the normies)
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous" }))

-- Move window in a workspace
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Move window through workspaces
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -10, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 10, y = 0 }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -10 }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 10 }), { repeating = true })

-- NOTE: This is the most useless thing ever
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Multimedia
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- Random stuff
hl.bind("XF86Calculator", hl.dsp.exec_cmd("kitty -e python3"), { locked = true, repeating = true })

