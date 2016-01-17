#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

export rvm_ignore_gemrc_issues=1
my_test_interactive && test -r "$HOME/.rvm/scripts/rvm" && . "$HOME/.rvm/scripts/rvm"
