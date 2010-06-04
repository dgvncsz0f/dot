#!/bin/sh

test -r $HOME/.xresourcesrc && xrdb -load $HOME/.xresourcesrc
test -r $HOME/.xmodmaprc && xmodmap $HOME/.xmodmaprc

exec ssh-agent openbox-session 
