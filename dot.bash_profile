# -*- mode: Shell-script; sh-basic-offset: 2; -*-

[ -f /etc/profile ] && source /etc/profile
[ -f "${HOME}/.bash_profile.local" ] && source "${HOME}/.bash_profile.local"
[ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc"
