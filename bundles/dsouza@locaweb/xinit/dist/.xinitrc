#!/usr/bin/env BASH_ENV=~/.bashrc /bin/bash

xscreensaver -no-splash&
/usr/bin/xset && /usr/bin/xset -b b off
/usr/bin/xsetroot -solid black
/usr/bin/xsetroot -cursor_name left_ptr
/usr/bin/setxkbmap us_intl
/usr/bin/xrdb -I$HOME -load $HOME/.xresourcesrc
/usr/bin/xmodmap $HOME/.xmodmaprc
xrandr --output DisplayPort-0 --mode 1680x1050 --pos 0x0    --rotate normal --right-of DisplayPort-1 \
       --output DisplayPort-1 --mode 1680x1050 --pos 1680x0 --rotate normal --primary
{ systat2dzen | run_dzen2_top -ta l -xs 1 -fn terminus-9; }&
xmonad | run_dzen2_bottom -ta l -xs 1 -fn terminus-9
