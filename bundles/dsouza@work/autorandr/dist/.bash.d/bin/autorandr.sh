#!/bin/sh

hdmi1_enabled () {
  xrandr -q | grep HDMI2 | grep -qv disconnected
}

hdmi1_connect () {
  xrandr --output LVDS1 --auto --left-of HDMI2 --output HDMI2 --auto
}

hdmi1_disconnect () {
  xrandr --output LVDS1 --auto --output HDMI2 --off
}

hdmi1_state=-1
while sleep 5
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
