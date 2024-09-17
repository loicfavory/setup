#!/bin/bash

# Fade the screen and wait. Needs xbacklight.
# When receiving SIGHUP, stop fading and set backlight to original brightness.
# When receiving SIGTERM, wait a bit, and set backlight to original brightness
# (this prevents the screen from flashing before it is turned completely off
# by DPMS in the locker command).

min_brightness=0

BRIGHTNESS=$(brightnessctl get)
trap "brightnessctl set $BRIGHTNESS" EXIT
trap 'kill %%; exit 0' HUP
trap 'sleep 1s; kill %%; exit 0' TERM

brightnessctl set $min_brightness
wait
sleep infinity & # No, sleeping in the foreground does not work
wait
