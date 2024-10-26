#!/bin/sh

readonly CMD=$1

readonly COLOR_OFF="%{F#a54242}"
readonly ICON_OFF=" "
readonly COLOR_ON="%{F#a3be8c}"
readonly ICON_ON=" "

show_icon() {
    paused=$(dunstctl is-paused)
    
    if [ "$paused" = "true" ]; then
        echo $COLOR_OFF$ICON_OFF
    else
        echo $COLOR_ON$ICON_ON
    fi
}

toggle() {
    dunstctl set-paused toggle
}


case $CMD in
    
    "--show")
        show_icon
        exit 1
    ;;
    
    "--toggle")
        toggle
        exit 1
    ;;
    
    *)
        echo "Invalid command"
        echo ""
        echo "Available commands :"
        echo "--toggle                   Toggle dunst on/off"
        echo "--show                     Show icons"
        exit 0
    ;;
    
esac
