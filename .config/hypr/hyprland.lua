-- TODO: See what can be unified in common files
-- NOTE: There are not permissions configured, this is anarchy

local machine_type = os.getenv("HEFER_MACHINE_TYPE")

-- Monitors
if machine_type == "laptop" then
	require("monitors/monitors-laptop")
else
	require("monitors/monitors-desktop")
end

-- Autostart
if machine_type == "laptop" then
	require("autostart/autostart-laptop")
else
	require("autostart/autostart-desktop")
end

-- Style
require("style/style")

-- Input
require("input/input")

-- Keybinds
require("keybinds/keybinds")

-- Window rules
require("windows/windows")
