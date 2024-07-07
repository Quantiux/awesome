# AwesomeWM config

This repo contains my configuration files for [Awesome window manager](https://awesomewm.org/). The main file `rc.lua` is *modularized*, with individual modules located in the `modules` folder. This is a simple structure, nothing fancy. I first customized the default file `/etc/xdg/awesome/rc.lua` to suit my need, split it into separate components based on their functionality, and finally loaded them *sequentially* as they appear in the original file.

Together with my other configs for [polybar](https://github.com/Quantiux/polybar) as statusbar, [picom](https://github.com/Quantiux/picom) as compositor, and [rofi](https://github.com/Quantiux/rofi) as application launcher, I finally have the windows environment I need to replace the Xfce desktop environment that came bundled with Linux Mint OS. I love the rock-solid stability of LM, just needed a tiling WM that offers full use of screen space on my laptop.
