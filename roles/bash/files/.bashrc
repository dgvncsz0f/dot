#!/bin/bash

. $HOME/.bash.d/libdx15

unset PROMPT_COMMAND

for f in $(find $HOME/.bash.d/include.d -type f)
do . $f; done
