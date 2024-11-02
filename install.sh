#!/bin/sh

INSTALL_PATH=${PWD}

# CONFIGURE GIT
git config --global user.email "loic@effetb.com"
git config --global user.email "Loïc Lazar-Favory"

# SET TIMEZONE
sudo timedatectl set-timezone Europe/Paris

# INSTALL CAMERA

sudo apt install linux-oem-24.04
sudo add-apt-repository ppa:oem-solutions-group/intel-ipu6
sudo apt install libcamhal0 libcamhal-ipu6ep0 gstreamer1.0-icamera v4l2-relayd
sudo apt install linux-modules-ipu6-oem-24.04

# Install conf files
ln -s $INSTALL_PATH/.config/* ~/.config/
ln -s $INSTALL_PATH/.fonts ~/.fonts
ln -s $INSTALL_PATH/.icons ~/.icons
ln -s $INSTALL_PATH/.oh-my-zsh ~/.oh-my-zsh
ln -s $INSTALL_PATH/.themes ~/.themes
ln -s $INSTALL_PATH/.xinitrc ~/.xinitrc
ln -s $INSTALL_PATH/.p10k.zsh ~/.p10k.zsh
ln -s $INSTALL_PATH/.profile ~/.profile
ln -s $INSTALL_PATH/.zshrc ~/.zshrc
ln -s $INSTALL_PATH/.aliases ~/.aliases

# REMOVE SNAP
sudo systemctl stop snapd && sudo systemctl disable snapd
sudo apt purge -y snapd

# INSTALL I3
sudo apt install xorg xinit
sudo apt install i3
sudo apt install autorandr x11-xserver-utils arandr rofi nitrogen lxappearance
sudo apt install dunst xssproxy redshift
sudo apt install dbus-x11 dbus-user-session dbus-broker dbus gir1.2-freedesktop

# INSTALL THUNAR
sudo apt install thunar thunar-archive-plugin gvfs

# INSTALL BLUETOOTH
sudo apt install bluetooth blueman
sudo apt install libldacbt-{abr,enc}2 libspa-0.2-bluetooth pulseaudio-module-bluetooth-
sudo apt install pipewire-media-session- wireplumber
systemctl --user --now start wireplumber.service
sudo systemctl enable bluetooth

# INSTALL MEDIA CONTROL
sudo apt install playerctl brightnessctl pnmixer
sudo usermod -aG video ${USER}

# INSTALL TOOLS
sudo apt install keepass2 redshift-gtk geany terminator rfkill htop
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# INSTALL FLATPAK
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=Catppuccin-Dark-Macchiato
flatpak install -y flathub org.mozilla.Thunderbird
flatpak install -y flathub com.todoist.Todoist
flatpak install -y flathub chat.rocket.RocketChat
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub org.chromium.Chromium
flatpak install -y flathub org.dbgate.DbGate
flatpak install -y flathub org.filezillaproject.Filezilla
flatpak install -v flathub com.vivaldi.Vivaldi

# INSTALL OH MY ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Please set default shell to /bin/zsh"
chsh



# CONFIGURE NETWORK MANAGER
sudo apt install network-manager network-manager-openvpn network-manager-gnome
sudo cat << EOF | sudo tee /etc/netplan/01-network-manager-all.yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
EOF
sudo systemctl disable --now systemd-networkd.service

apt autoremove

echo "Setup done, you should reboot now"
