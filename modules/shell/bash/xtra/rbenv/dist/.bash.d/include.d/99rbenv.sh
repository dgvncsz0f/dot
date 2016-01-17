#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

my_test_interactive && {
  if command -v rbenv >/dev/null 2>/dev/null
  then eval "$(rbenv init -)"; fi
}
