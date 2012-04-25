#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

[ -f /etc/profile ] && . /etc/profile
[ -f "${HOME}/.bash_profile.local" ] && . "${HOME}/.bash_profile.local"
[ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
