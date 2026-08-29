local terminal = "kitty"
local fileManager = "kitty -e yazi"
local menu = "pkill fsel || kitty --title launcher -e fsel -d"
local browser = "firefox"
local lock = "hyprlock"
local power = "pkill wlogout || wlogout --buttons-per-row 6"
local print_screen = "hyprshot -m output"
local print_window = "hyprshot -m window"
local print_region = "hyprshot -m region"

return {
    terminal = terminal,
    fileManager = fileManager,
    menu = menu,
    browser = browser,
    lock = lock,
    power = power,
    print_screen = print_screen,
    print_window = print_window,
    print_region = print_region
}
