# AwesomeWM config

This repo contains my configuration files for [Awesome window manager](https://awesomewm.org/). The main file `rc.lua` is *modularized*, with individual modules located in the `modules` folder. This is a simple structure, nothing fancy. I first customized the default file `/etc/xdg/awesome/rc.lua` to suit my need, split it into separate components based on their functionality, and then loaded them **sequentially** as they appear in the original file.
