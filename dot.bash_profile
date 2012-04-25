#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

[ -f /etc/profile ] && source /etc/profile
[ -f "${HOME}/.bash_profile.local" ] && source "${HOME}/.bash_profile.local"
[ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc"

for f in $(find "${HOME}/.dot/dot.bash_completion.d" -type f)
do
  source "$f"
done
