local awful = require("awful")

-- list of autostarted applications
awful.spawn.with_shell("picom")
-- comment the line below (fixed wallpaper set in theme.lua)
-- awful.spawn.with_shell("~/.config/awesome/scripts/auto-wall.sh") -- randomly switch wallpaper
-- next 3 launchers are for polybar's systray
awful.spawn.with_shell("nm-applet") -- for wifi module to show up on systray
-- gnome authentication agent for GUI sudo prompt (for mintupdate, timeshift etc)
awful.spawn.with_shell("/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")
-- awful.spawn.with_shell("mintupdate-launcher")  -- use "checkupdates" module in polybar instead
-- spawn redshift with Ann Arbor's' LAT:LON (https://www.geonames.org)
-- make sure no previous redshift instance exists (to accounot for its `Restart=always` argument)
awful.spawn.with_shell("pgrep -x redshift-gtk > /dev/null || redshift-gtk -l 42.25323:-83.83877")
awful.spawn.with_shell("~/.config/polybar/launch.sh")
awful.spawn.with_shell("xfce4-power-manager") -- for power management
-- for volume control with keys (make sure only one instance is active)
awful.spawn.with_shell("pgrep -x xfce4-volumed > /dev/null || xfce4-volumed")
awful.spawn.with_shell("~/.config/awesome/scripts/start-syncthing.sh")
