#!/bin/sh

readonly CMD=$1

readonly VPN_PATH=$HOME/Documents/Config/VPN/EffetB
readonly COLOR_OFF="%{F#66ffffff}"
readonly ICON_OFF=""
readonly COLOR_ON="%{F#a3be8c}"
readonly ICON_ON=""

show_icon() {
    openvpn=$(nmcli con show --active | grep vpn | awk -F" " '{print $1}')
    openfortivpn=$(pgrep -a openfortivpn | head -n 1 | awk '{print $NF }' | rev | cut -d '/' -f 1 | rev)
    
    if [ -n "$openvpn" ]; then
        echo $COLOR_ON$ICON_ON $openvpn
    elif [ -n "$openfortivpn" ] ; then
        echo $COLOR_ON$ICON_ON
    else
        echo $COLOR_OFF$ICON_OFF
    fi
}

kill_vpn_gui() {
    cmd=$(
        yad
        --undecorated --fixed --close-on-unfocus --borders=0
        --button="Kill VPN"
        --posx="2030" --posy="35"
)
    "${cmd[@]}"
    exval=$?
}

toggle() {
#    openvpn=$(pgrep -a openvpn | head -n 1 | awk '{print $NF }' | rev | cut -d '/' -f 1 | rev)

 #   if [ -n "$openvpn" ]; then
  #          nmcli con down EffetB
   # else
    #        nmcli con up EffetB
    #fi
#	terminator -e 'nmtui connect' &
    bash /home/loic/.config/rofi/scripts/rofi-vpn
}


case $CMD in
    
    "--show")
        show_icon
    ;;
    
    "--toggle")
        toggle
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
