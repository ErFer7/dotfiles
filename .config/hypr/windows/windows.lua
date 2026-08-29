hl.window_rule({
	name = "windowrule-1",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	match = {
		title = "launcher",
	},
	float = true,
	center = true,
	size = { 500, 430 },
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "windowrule-2",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
