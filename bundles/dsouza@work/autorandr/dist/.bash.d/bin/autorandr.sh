#!/bin/sh

hdmi1_enabled () {
  xrandr -q | grep HDMI1 | grep -qv disconnected
}

hdmi1_connect () {
  xrandr --output eDP1 --auto --left-of HDMI1 --output HDMI1 --auto
}

hdmi1_disconnect () {
  xrandr --output eDP1 --auto --output HDMI1 --off
}

hdmi1_state=-1
while sleep 2.5
do
  if hdmi1_enabled
  then
    if [ "$hdmi1_state" -ne 0 ]
    then hdmi1_connect; fi
    hdmi1_state=0
  else
    if [ "$hdmi1_state" -ne 1 ]
    then hdmi1_disconnect; fi
    hdmi1_state=1
  fi
done
