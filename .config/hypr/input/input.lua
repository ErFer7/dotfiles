local machine_type = os.getenv("HEFER_MACHINE_TYPE")

hl.config({
	input = {
		kb_layout = "br",
		kb_variant = "abnt2",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = machine_type == "desktop",

		follow_mouse = 1,

        -- TODO: Check if this should stay like this
		sensitivity = (machine_type == "desktop") and -0.65 or 0,

		touchpad = {
			natural_scroll = false,
		},

		tablet = {
			left_handed = machine_type == "desktop",
		},
	},
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "swipe", action = "resize" })

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
