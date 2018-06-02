#!/bin/bash

shopt -s histappend
shopt -s extglob
shopt -s extquote
shopt -s cdspell
shopt -s dirspell
shopt -s globstar
shopt -s checkjobs
shopt -s checkwinsize

export PS1='\u@\H [\w]\n\$ '
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=10000
export HISTSIZE=7500
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE=" *"

if [ -r /etc/profile ]
then . /etc/profile; fi

if [ -e $HOME/.bash.d/functions ]
then . $HOME/.bash.d/functions; fi

for d in $(find $HOME/.bash.d/bin -type d -o -type l)
do PATH="$PATH:$(realpath $d)"; done
export PATH

for f in $(find $HOME/.bash.d/profile.d -type f)
do . $f; done

if [ -r $HOME/.bashrc ]
then . $HOME/.bashrc; fi
