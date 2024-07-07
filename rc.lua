-- load packages via luarocks if exists, no sweat if not
pcall(require, "luarocks.loader")

-- load modules (order matters!)
require("modules.errors") -- error handling module
require("modules.themes") -- themes module
require("modules.layouts") -- layouts module
require("modules.keybindings") -- keybindings module
require("modules.rules") -- rules module
require("modules.signals") -- signal handling module
require("modules.autostart") -- applications autostart module
