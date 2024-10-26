#!/bin/sh
lock() {
    pkill -9 picom
    /home/loic/.config/i3/scripts/lock.sh
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
        i3lock -c 000000 && systemctl suspend
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
