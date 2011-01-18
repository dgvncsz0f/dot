#!/bin/sh

test -r $HOME/.Xresourcesrc && /usr/bin/xrdb -merge $HOME/.Xresourcesrc
test -r $HOME/.Xresourcesrc.local && /usr/bin/xrdb -merge $HOME/.Xresourcesrc.local
test -r $HOME/.Xmodmaprc && xmodmap $HOME/.Xmodmaprc
test -x /usr/bin/trayer && /usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --transparent false --tint 0x00 --height 22&
test -x /usr/bin/xscreensaver && /usr/bin/xscreensaver -no-splash&
test -x /usr/bin/xset && /usr/bin/xset -b b off
test -x /usr/bin/setxkbmap && /usr/bin/setxkbmap us intl
test -x /usr/bin/xsetroot && \
{
  /usr/bin/xsetroot -solid black
  /usr/bin/xsetroot -cursor_name left_ptr
}

exec ssh-agent /usr/bin/xmonad
