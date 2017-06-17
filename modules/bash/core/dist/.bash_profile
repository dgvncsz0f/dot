#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

[ -r /etc/profile ] && . /etc/profile

if [ -e $HOME/.bash.d/functions ]
then . $HOME/.bash.d/functions; fi

for f in $(find $HOME/.bash.d/profile.d -type f)
do
  [ -r $f ] && . $f
done

[ -r $HOME/.bashrc ] && . $HOME/.bashrc
