#!/usr/bin/env BASH_ENV=~/.bashrc /bin/bash

if xrandr -q | grep -iq hdmi2.connected
then
  xrandr --output LVDS1 --mode 1366x768  \
                        --pos 0x0        \
                        --right-of HDMI2 \
         --output HDMI2 --mode 2560x1080 \
                        --pos 1366x0     \
                        --primary
fi

setxkbmap -layout us -variant colemak

xset r rate 750 40
xset -b b off
xrdb -I$HOME -load $HOME/.xresourcesrc
xsetroot -solid black
xsetroot -cursor_name left_ptr

if lsusb | grep -iq kinesis
then xmodmap $HOME/.xmodmaprc_kinesis
else xmodmap $HOME/.xmodmaprc
fi

systemctl --user set-environment DISPLAY=$DISPLAY
systemctl --user start redshift
xscreensaver -no-splash&

xmonad
