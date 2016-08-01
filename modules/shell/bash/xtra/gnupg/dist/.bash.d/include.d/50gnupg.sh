#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

export GNUPGHOME="$HOME/enc/gnupg"

my_gpgagent_envfile=$HOME/.gpg-agent.env

my_test_ssh_connection ()
{
  test -n "$SSH_CONNECTION"
}

my_gpgagent_export ()
{
  if [ -f $my_gpgagent_envfile ]
  then
    eval $(cat $my_gpgagent_envfile)
  fi
}

my_gpgagent_running ()
{
  my_gpgagent_export
  if /usr/bin/gpg-connect-agent --agent-program /bin/false /bye 2>/dev/null
  then
    return 0
  else
    rm -f $my_gpgagent_envfile
    return 1
  fi
}

my_gpgagent_init ()
{
  if ! my_gpgagent_running
  then
    if [ -d "$HOME/enc/gnupg" ]
    then
      /usr/bin/gpg-agent              \
        --sh                          \
        --daemon                      \
        --homedir "$HOME/enc/gnupg"   \
        --max-cache-ttl 28800         \
        --default-cache-ttl 28800     \
        --max-cache-ttl-ssh 28800     \
        --enable-ssh-support          \
        --default-cache-ttl-ssh 28800 >$my_gpgagent_envfile
    fi
  fi
}

! my_test_ssh_connection && {
  my_gpgagent_init
  my_gpgagent_export
}
