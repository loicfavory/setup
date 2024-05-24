Installation instructions

Installation instructions

`$ sudo apt install xorg xinit`

`wget https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb`

sudo apt install ./sur5r-keyring_2024.03.04_all.deb

echo "deb http://debian.sur5r.net/i3/ $(lsb_release -sc) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

sudo apt update

sudo apt install i3

sudo apt install network-manager network-manager-openvpn

sudo vim /etc/netplan/01-network-manager-all.yaml

sudo apt install dbus-x11 dbus-user-session dbus-broker dbus gir1.2-freedesktop

sudo apt install thunar thunar-archive-plugin

sudo apt install keepass2

# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager

sudo systemctl disable --now systemd-networkd.service

reboot

apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

sudo apt install autorandr x11-xserver-utils arandr rofi nitrogen lxappearance

# Appliquer les thèmes

git clone --recursive https://github.com/polybar/polybar && cd polybar


mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/bin
sudo make install

sudo apt install picom unzip

ln -s /home/loic/Projects/config-linux/rofi /home/loic/.config/

git clone https://github.com/lr-tech/rofi-themes-collection.git && cd rofi-themes-collection

mkdir -p ~/.local/share/rofi/themes/

cp themes/rounded-nord-dark.rasi ~/.local/share/rofi/themes/

cp themes/rounded-common.rasi ~/.local/share/rofi/themes/

# Supprimer SNAP

sudo systemctl stop snapd && sudo systemctl disable snapd

sudo apt purge -y snapd 

sudo apt install libldacbt-{abr,enc}2 libspa-0.2-bluetooth pulseaudio-module-bluetooth-

sudo apt install pipewire-media-session- wireplumber

wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

systemctl --user --now start wireplumber.service