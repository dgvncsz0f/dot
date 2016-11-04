#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

. $HOME/.bash.d/functions

my_maybe_mount_gocryptfs()
{
  if { command -v gocryptfs && command -v mount && command -v grep; } 2>/dev/null >/dev/null
  then
    if [ -d "$HOME/.enc" ]
    then
      if ! mount | grep -q "$HOME/enc"
      then
        echo "WARN: $HOME/enc is not mounted" >&2
      fi
    fi
  fi
}

my_test_interactive && my_maybe_mount_gocryptfs
