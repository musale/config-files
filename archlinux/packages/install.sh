#!/bin/bash
BLUE='\033[1;34m'
NC='\033[0m'
YAOURT="../archlinux/yaourt/install.sh"
PACKAGES_INSTALL="./packages/install.sh"

. $YAOURT

# Get fastest servers
sudo pacman -S --noconfirm --needed reflector
echo -e "${BLUE}Getting the fastest servers${NC}"
sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d
echo -e "${BLUE}The fastest servers found${NC}"
cat /etc/pacman.d/mirrorlist
echo -e "${BLUE}Updating the system${NC}"
sudo pacman --noconfirm -Syu
echo -e "${BLUE}Done updating the system. Setting up...${NC}"

# Install my zero config packages
sudo pacman -S --noconfirm --needed curl wget vim htop grep sed bash 

# Install editor, browser and tools
sudo pacman -S --noconfirm --needed vlc transmission-gtk
sudo pacman -S --noconfirm --needed notify-osd arandr tree
sudo pacman -S --noconfirm --needed xorg-server xorg-apps xorg-xinit xorg-xrandr
sudo pacman -S --noconfirm --needed gvfs unrar unzip
yaourt -S --noconfirm google-chrome-stable visual-studio-code light-git

# Install theme for desktop and tools
sudo pacman -S --noconfirm --needed thunar xcursor-simpleandsoft lxappearance-gtk3
sudo pacman -S --noconfirm --needed adapta-gtk-theme papirus-icon-theme

# Install python2 and python3
sudo pacman -S --noconfirm --needed python python2 python-pip python2-pip

# Install pip requirements
sudo pip install virtualenvwrapper docker-compose youtube-dl

# Install golang
sudo pacman -S --noconfirm --needed go go-tools
mkdir -p $HOME/go/{src,bin}
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Install docker
sudo pacman -S --noconfirm --needed docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

# Install network manager
sudo pacman -S --noconfirm --needed networkmanager network-manager-applet
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

# Install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash

# Install cronie for cronjobs
sudo pacman -S --noconfirm --needed cronie
sudo systemctl enable cronie.service
sudo systemctl start cronie.service

# Install sound and volume
sudo pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pulseaudio-jack pavucontrol
sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
sudo pacman -S --noconfirm --needed volumeicon playerctl

# Install bluetooth
sudo pacman -S --noconfirm --needed pulseaudio-bluetooth bluez bluez-libs
sudo pacman -S --noconfirm --needed bluez-utils bluez-firmware blueberry

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl daemon-reload

echo -e "${BLUE}Done installing packages.${NC}"