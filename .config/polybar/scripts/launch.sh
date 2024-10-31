#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
#killall -q polybar

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar example 2>&1 | tee -a /tmp/polybar1.log & disown

if type "xrandr"; then
  monitor="eDP-1"	
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	if [ "$m" = "DP-3-2" ]  || [ "$m" = "DP-3" ]|| [ "$m" = "DP-1" ]; then
		monitor=$m
	fi
  done
fi
if [ -z $MONITOR ]; then
  MONITOR=$monitor polybar --reload main &
fi

# echo "Bars launched..."
