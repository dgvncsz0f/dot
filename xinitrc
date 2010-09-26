#!/bin/sh

test -r $HOME/.xresourcesrc && xrdb -load $HOME/.xresourcesrc
test -r $HOME/.xmodmaprc && xmodmap $HOME/.xmodmaprc
test -x /usr/bin/trayer && /usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --transparent false --tint 0x00 --height 22&
test -x /usr/bin/unclutter && /usr/bin/unclutter&
test -x /usr/bin/xscreensaver && /usr/bin/xscreensaver -no-splash&
test -x /usr/bin/xsetroot && \
{
  /usr/bin/xsetroot -solid black
  /usr/bin/xsetroot -cursor_name left_ptr
}

# exec ssh-agent openbox-session 
exec ssh-agent /usr/bin/xmonad
