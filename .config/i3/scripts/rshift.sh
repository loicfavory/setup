#!/bin/sh

readonly CMD=$1

readonly CACHE_DIR="$HOME/.cache/rshift"
readonly CACHE="$CACHE_DIR/current"

readonly COLOR_NIGHT="%{F#66ffffff}"
readonly ICON_NIGHT=""
readonly COLOR_DAY="%{F#a3be8c}"
readonly ICON_DAY=""
readonly COLOR_DEFAULT="%{F#a3be8c}"
readonly ICON_DEFAULT=""

/usr/bin/redshift -x
pkill -9 redshift
mkdir -p $CACHE_DIR
touch $CACHE

load(){
    set MODE = $(cat $CACHE)
    echo $(cat $CACHE)

    case $MODE in
        "--day")
            /usr/bin/redshift -l 45.74:4.96 -t 6000:6000
        ;;
        "--night")
            /usr/bin/redshift -l 45.74:4.96 -t 1500:1500
        ;;
        "--default")
            /usr/bin/redshift -l 45.74:4.96
        ;;
    esac
}

show_icon(){
    set MODE = $(cat $CACHE)
    case $MODE in
        "--day")
            echo $COLOR_DAY$ICON_DAY
        ;;
        "--night")
            echo $COLOR_NIGHT$ICON_NIGHT
        ;;
        "--default")
            echo $COLOR_DEFAULT$ICON_DEFAULT
        ;;
    esac
}


case $CMD in
    "--day")
        echo $CMD > $CACHE
        load
    ;;
    "--night")
        echo $CMD > $CACHE
        load
    ;;
    "--default")
        echo $CMD > $CACHE
        load
    ;;
    "--load")
        load
    ;;
    *)
        echo "Invalid command"
        echo ""
        echo "Available commands :"
        echo "--toggle                   Toggle vpn on/off"
        echo "--show                     Show icons"
        exit 0
    ;;
esac
