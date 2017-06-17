#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

. $HOME/.bash.d/init

dx15_is_interactive && {
  if command -v rbenv >/dev/null 2>/dev/null
  then eval "$(rbenv init -)"; fi
}
