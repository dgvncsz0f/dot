#!/bin/sh

/usr/bin/pkill -u $USER gpg-agent
test -x /usr/bin/gpg-agent && test -z "${GPG_AGENT_INFO}" && eval $(/usr/bin/gpg-agent --daemon --max-cache-ttl 28800 --default-cache-ttl 28800 --quiet)
exec ssh-agent /bin/sh $HOME/.xinitrc.local
