#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

test -x /usr/bin/gpg-agent && test -z "${GPG_AGENT_INFO}" && {
  pkill gpg-agent
  eval $(/usr/bin/gpg-agent --daemon --max-cache-ttl 28800 --default-cache-ttl 28800 --quiet)
}

[ -f /etc/profile ] && . /etc/profile
[ -f "${HOME}/.bash_profile.local" ] && . "${HOME}/.bash_profile.local"
[ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
