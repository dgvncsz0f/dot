#!/bin/sh

test -r $HOME/.xresourcesrc && /usr/bin/xrdb -merge $HOME/.xresourcesrc
test -r $HOME/.xmodmaprc && xmodmap $HOME/.xmodmaprc
test -x /usr/bin/xset && /usr/bin/xset -b b off
test -x /usr/bin/gpg-agent && test -z "${GPG_AGENT_INFO}" && eval $(/usr/bin/gpg-agent --daemon --max-cache-ttl 28800 --default-cache-ttl 28800 --quiet)
test -x /usr/bin/xsetroot && \
{
  /usr/bin/xsetroot -solid black
  /usr/bin/xsetroot -cursor_name left_ptr
}

exec ssh-agent dbus-launch /bin/sh $HOME/.xinitrc.local
