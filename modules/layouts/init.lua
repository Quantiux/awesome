-- Sets up menu bar, terminal and workspace layout

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local menubar = require("menubar")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Disable window snapping
awful.mouse.snap.edge_enabled = false

-- {{{ Menu
-- Create a launcher widget and a main menu (available on right-click)
myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = { menu_awesome },
		after = { menu_terminal },
	})
else
	mymainmenu = awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		},
	})
end

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile.left, -- new pane opens right (confusing, I know)
	awful.layout.suit.floating,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.max,
	-- awful.layout.suit.tile,
	-- awful.layout.suit.tile.bottom,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}

-- function to set wallpaper to each workspace
local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	local names = { "Nvim", "Note", "WWW", "Mail", "Chat", "Chrome", "", "" }
	local l = awful.layout.suit
	local layouts =
		{ l.tile.left, l.tile.left, l.tile.left, l.tile.left, l.tile.left, l.tile.left, l.floating, l.floating }
	awful.tag(names, s, layouts)
	-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end)
-- }}}
