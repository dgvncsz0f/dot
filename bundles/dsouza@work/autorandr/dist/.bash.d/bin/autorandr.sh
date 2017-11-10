#!/bin/sh

query () {
  (IFS=$'\n'
   for input in $(xrandr -q | grep -Eo '^.*? (dis)?connected\b')
   do
     head=$(echo "$input" | cut -d' ' -f1)
     state=$(echo "$input" | cut -d' ' -f2)
     case "$state" in
       (disconnected)
         echo -n "--output $head --off "
         ;;
       (connected)
         echo -n "--output $head --auto "
         ;;
     esac
   done)
}

xrandr $(query)
