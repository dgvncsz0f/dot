#!/usr/bin/env BASH_ENV=~/.bashrc /bin/bash

/usr/bin/xset && /usr/bin/xset -b b off
/usr/bin/xsetroot -solid black
/usr/bin/xsetroot -cursor_name left_ptr
/usr/bin/setxkbmap -geometry kinesis -layout us -variant colemak
/usr/bin/xrdb -I$HOME -load $HOME/.xresourcesrc
/usr/bin/xmodmap $HOME/.xmodmaprc
xrandr --output DVI-0  --mode 1920x1080 --pos 0x0 --rotate normal --right-of DVI-1 --output DVI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --primary
python2 $(which systat2dzen) | run_dzen2_top -ta l -xs 2 -fn terminus-9&
systemctl --user set-environment DISPLAY=$DISPLAY
systemctl --user start redshift
xmonad | run_dzen2_bottom -ta l -xs 2 -fn terminus-9
