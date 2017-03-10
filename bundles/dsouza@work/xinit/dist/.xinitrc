#!/usr/bin/env BASH_ENV=~/.bashrc /bin/bash

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

if xinput list | grep -q Touchscreen
then xinput -disable $(xinput list | grep -i touchscreen | grep -o id=[0-9]* | cut -d= -f2)
fi

systemctl --user set-environment DISPLAY=$DISPLAY
systemctl --user start redshift

exec xmonad
