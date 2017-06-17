#!/bin/bash
# -*- mode: Shell-script; sh-basic-offset: 2; -*-

if [ -r $HOME/.bash.d/functions ]
then . $HOME/.bash.d/functions; fi

for f in $(find $HOME/.bash.d/include.d -type f)
do
  [ -f "$f" -a -r "$f" ] && . $f
done

for d in $(find $HOME/.bash.d/bin -type d)
do
  PATH="$PATH:$d"
done

unset PROMPT_COMMAND
export PATH
