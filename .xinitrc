#!/bin/sh


dbus-update-activation-environment --systemd DISPLAY
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)


exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3

WINIT_HIDPI_FACTOR=1

