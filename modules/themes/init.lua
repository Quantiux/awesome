local beautiful = require("beautiful")
local gears = require("gears")

-- Themes define colors, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "modules/themes/theme.lua")
