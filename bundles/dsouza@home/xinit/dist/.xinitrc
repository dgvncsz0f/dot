#!/usr/bin/env BASH_ENV=~/.bashrc /bin/bash

if xrandr -q | grep -q VGA1.connected
then
  xrandr --output LVDS1 --mode 1366x768 \
                        --pos 0x0       \
                        --rotate normal \
                        --right-of VGA1 \
         --output VGA1 --mode 1680x1050 \
                       --pos 1366x0     \
                       --rotate normal  \
                       --primary  
fi

/usr/bin/xset && /usr/bin/xset -b b off
/usr/bin/xsetroot -solid black
/usr/bin/xsetroot -cursor_name left_ptr
/usr/bin/setxkbmap -layout us -variant colemak
/usr/bin/xrdb -I$HOME -load $HOME/.xresourcesrc
/usr/bin/xmodmap $HOME/.xmodmaprc
{ python2 $(which systat2dzen) | run_dzen2_top -ta l -xs 1 -fn terminus-9; }&
systemctl --user set-environment DISPLAY=$DISPLAY
systemctl --user start redshift
xmonad | run_dzen2_bottom -ta l -xs 1 -fn terminus-9
