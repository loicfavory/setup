#!/bin/sh

INSTALL_PATH=${PWD}

# CONFIGURE GIT
git config --global user.email "loic@effetb.com"
git config --global user.email "Loïc Lazar-Favory"

# SET TIMEZONE
sudo timedatectl set-timezone Europe/Paris

# REMOVE SNAP
sudo systemctl stop snapd && sudo systemctl disable snapd
sudo apt purge -y snapd

# Install conf files
ln -s $INSTALL_PATH/.config/* ~/.config/
ln -s $INSTALL_PATH/.fonts ~/
ln -s $INSTALL_PATH/.icons ~/
ln -s $INSTALL_PATH/.oh-my-zsh ~/
ln -s $INSTALL_PATH/.themes ~/
ln -s $INSTALL_PATH/.xinitrc ~/
ln -s $INSTALL_PATH/.p10k.zsh ~/
ln -s $INSTALL_PATH/.profile ~/
ln -s $INSTALL_PATH/.zshrc ~/
ln -s $INSTALL_PATH/.aliases ~/

exit 0

# Install neovim
sudo apt install neovim

# INSTALL I3
sudo apt install xorg xinit
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3 picom xautolock
sudo apt install autorandr x11-xserver-utils arandr rofi nitrogen lxappearance
sudo apt install xssproxy redshift
sudo apt install dbus-x11 dbus-user-session dbus-broker dbus gir1.2-freedesktop
sudo apt install lxpolkit

# INSTALL DUNST
sudo apt install dbus libxinerama libxrandr libxss glib pango libnotify xdg-utils
sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libgdk-pixbuf-2.0-dev librsvg2-dev
sudo apt install libnotify-dev
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

#old.kadoenjoy.com.
 #	0 	A 	54.36.91.62

# INSTALL APPIMAGE
sudo add-apt-repository universe
sudo apt update
sudo apt install libfuse2
wget -v https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt install ./appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
rm appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
tar -zxvf ./assets/jetbrains-toolbox-2.5.1.34629.tar.gz
sudo mv jetbrains-toolbox-2.5.1.34629/jetbrains-toolbox /opt/jetbrains-toolbox

# Install Polybar
sudo apt install g++ clang git cmake cmake-data pkg-config\tpython3 python3-sphinx\tpython3-packaging
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev
sudo apt install libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen
sudo apt install xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev
sudo apt install libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# INSTALL THUNAR
sudo apt install thunar thunar-archive-plugin gvfs

# INSTALL BLUETOOTH
sudo apt install bluetooth blueman
sudo apt install pipewire pipewire-audio pipewire-pulse wireplumber libspa-0.2-bluetooth
systemctl --user --now enable wireplumber.service
systemctl --user --now start wireplumber.service
sudo systemctl enable bluetooth
# CONFIGURE KEYCHRON
# Function keys are used as first key. Pressing 'F8' key will behave like a F8.
# Pressing 'fn'+'F8' will act as special key (play/pause).
echo "options hid_apple fnmode=2" | sudo tee /etc/modprobe.d/hid_apple.conf
# Disable autosuspend
echo "options btusb enable_autosuspend=n" | sudo tee /etc/modprobe.d/btusb_disable_autosuspend.conf
sudo update-initramfs -u -k all

# INSTALL PRINTERS
sudo apt install system-config-printer cups simple-scan
sudo adduser $USER lpadmin

# INSTALL MEDIA CONTROL
sudo apt install playerctl brightnessctl pasystray pavucontrol pulseaudio-utils
sudo usermod -aG video ${USER}

# INSTALL KEYRING
sudo apt install gnome-keyring libpam-gnome-keyring

# INSTALL SAMBA
sudo apt install gvfs-backends smbclient cifs-utils

# INSTALL TOOLS
sudo apt install keepass2 redshift-gtk geany terminator rfkill htop neofetch make mupdf \
      qimgv xclip maim qalculate-gtk smartmontools gnome-screenshot ffmpeg xdotool \
      tlp tlp-rdw
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# INSTALL FLATPAK
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=Catppuccin-Dark-Macchiato
flatpak install -y flathub com.github.tchx84.Flatseal
# Communication tools
flatpak install -y flathub org.mozilla.Thunderbird
flatpak install -y flathub chat.rocket.RocketChat
flatpak install -y flathub com.slack.Slack
# Browsers
flatpak install -y flathub org.chromium.Chromium
# Productivity
flatpak install -y flathub com.todoist.Todoist
flatpak install -y flathub org.filezillaproject.Filezilla
flatpak install -v flathub org.libreoffice.LibreOffice
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.gimp.GIMP
flatpak install flathub io.github.zen_browser.zen
# Media
flatpak install -v flathub com.spotify.Client

# Install Solaar
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update
sudo apt install solaar

# INSTALL DBGATE
wget https://github.com/dbgate/dbgate/releases/latest/download/dbgate-latest.deb
sudo apt install ./dbgate-latest.deb
rm dbgate-latest.deb

# CONFIGURE TOUCHPAD
sudo apt install xserver-xorg-input-synaptics
sudo cat << EOF | sudo tee /etc/X11/xorg.conf.d/50-synaptics.conf
# Active touchpad gesture
Section "InputClass"
        Identifier "touchpad catchall"
        Driver "synaptics"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Option "TapButton2" "3"
EndSection
EOF

# INSTALL DOCKER
# Remove installed packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER

# INSTALL OH MY ZSH
curl -sS https://starship.rs/install.sh | sh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Please set default shell to /bin/zsh"
chsh

# CONFIGURE NETWORK MANAGER
sudo apt install network-manager network-manager-openvpn network-manager-gnome network-manager-openvpn-gnome
sudo cat << EOF | sudo tee /etc/netplan/01-network-manager-all.yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
EOF
sudo systemctl disable --now systemd-networkd.service

sudo apt autoremove

# INSTALL CAMERA

sudo add-apt-repository ppa:oem-solutions-group/intel-ipu6
sudo apt install linux-modules-ipu6-generic-hwe-22.04 linux-modules-ivsc-generic-hwe-22.04
sudo apt install libcamhal-ipu6ep0

sudo apt install oem-somerville-tentacool-meta
sudo apt update
sudo apt full-upgrade
sudo systemctl poweroff

echo "Setup done, you should reboot now"

