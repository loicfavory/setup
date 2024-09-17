#!/bin/sh
lock() {
    pkill -9 picom
    i3lock --nofork -e -c '#220000'
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        pkill -9 picom
        systemctl suspend
        ;;
    hibernate)
        pkill -9 picom
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
