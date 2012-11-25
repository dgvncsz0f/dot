#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

. "$HOME/.bash.d/functions"

export GNUPGHOME="$HOME/sec/gnupg"

my_test_ssh_connection ()
{
  test -n "$SSH_CONNECTION"
}

my_gpgagent_export()
{
  if [ -f "$HOME/.gpg-agent.env" ]
  then
    . "$HOME/.gpg-agent.env"
    export GPG_AGENT_INFO
    export SSH_AGENT_PID
    export SSH_AUTH_SOCK
    /usr/bin/gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
  fi
}

my_gpgagent_cleanse()
{
  my_gpgagent_export

  if [ -x /usr/bin/gpg-connect-agent ]
  then
    if ! /usr/bin/gpg-connect-agent /bye 2>/dev/null
    then
      rm -f "$HOME/.gpg-agent.env"
    fi
  fi
}

my_gpgagent_init()
{
  local daemon_args

  my_gpgagent_cleanse
  if [ ! -f "$HOME/.gpg-agent.env" ]
  then
    if [ -d "$HOME/sec/gnupg" ]
    then
      /usr/bin/gpg-agent                        \
        --max-cache-ttl 28800                   \
        --default-cache-ttl 28800               \
        --max-cache-ttl-ssh 28800               \
        --default-cache-ttl-ssh 28800           \
        --daemon                                \
        --sh                                    \
        --homedir "$HOME/sec/gnupg"             \
        --enable-ssh-support                    \
        --write-env-file "$HOME/.gpg-agent.env" \
        $daemon_args
    fi
  fi
}

my_test_interactive && ! my_test_ssh_connection && {
  my_gpgagent_cleanse
  my_gpgagent_init
  my_gpgagent_export
}
