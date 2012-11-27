#!/usr/bin/env BASH_ENV=~/.bashrc /bin/bash

xset b off
xsetroot -bg black
xscreensaver -no-splash&
/usr/bin/setxkbmap us intl
xrdb -I$HOME $HOME/.xresourcesrc
xmodmap $HOME/.xmodmaprc
xmodmap $HOME/.xmodmaprc.local
# /home/dsouza/.dot/bin/restart_systat2dzen
xrandr --output DisplayPort-1 --mode 1680x1050 --pos 0x0 --rotate normal --output DisplayPort-0 --mode 1680x1050 --pos 1680x0 --rotate normal
xmonad | run_dzen2_bottom -ta l
