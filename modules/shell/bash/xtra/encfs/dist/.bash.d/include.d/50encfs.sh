#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

. $HOME/.bash.d/functions

my_maybe_mount_encfs()
{
  local bin_encfs
  local bin_mount
  local bin_wc
  local bin_grep

  if { command -v encfs && command -v mount && command -v grep; } 2>/dev/null >/dev/null
  then
    if [ -d "$HOME/.sec" ]
    then
      while ! mount | grep -q "$HOME/sec"
      do
        encfs "$HOME/.sec" "$HOME/sec" -o nonempty
      done
    fi
  fi
}

my_test_interactive && my_maybe_mount_encfs
