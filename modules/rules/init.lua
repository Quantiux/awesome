local awful = require("awful")
local beautiful = require("beautiful")

-- variables needed for resizing rule below
local screen_geometry = screen[1].workarea
local y_offset = 16 -- y-offset for polybar

-- {{{ Rules
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			-- maximized = false, -- prevent maximized opening
		},
	},

	-- rules to resize specified clients
	{
		rule_any = { class = { "Pix" } },
		properties = {
			width = screen_geometry.width * 0.95,
			height = (screen_geometry.height - y_offset) * 0.95,
		},
		callback = function(c)
			c:geometry({
				x = (screen_geometry.width - c.width) / 2,
				y = y_offset + (screen_geometry.height - c.height) / 2,
			})
		end,
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},

			class = {
				"MintUpdate.py",
				"Pavucontrol",
				"Gpick",
				"Timeshift-gtk",
				"Thunar",
				"Xed",
				"Pix",
				"Xviewer",
				"mpv",
				"avidemux3_qt5",
				"Filezilla",
				"File-roller",
				"KeePassXC",
				"Xfce4-taskmanager",
				"Xfce4-power-manager-settings",
				"Xdg-desktop-portal-gtk",
				"Yad",
				"Conky",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },

		-- rule to center all floating clients except yad (for calendar popup)
		callback = function(c)
			if c.class ~= "Yad" then
				awful.placement.centered(c, nil)
			end
		end,
	},

	-- titlebar to specified clients (excluding terminals, browsers)
	-- to enable titlebar for all, comment this section and uncomment original rule below
	{
		rule_any = {
			class = {
				"Thunar",
				"Xviewer",
				"mpv",
				"Xed",
				"Pix",
				"KeePassXC",
				"avidemux3_qt5",
			},
		},
		properties = { titlebars_enabled = true },
	},
	-- Add titlebars to normal clients and dialogs
	-- { rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },

	-- rule to disable polybar border (set by its own config.ini)
	{
		rule = { class = "Polybar" },
		properties = {
			border_width = 0,
			border_color = nil,
		},
	},
}
-- }}}
