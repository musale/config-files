#!/bin/bash
BLUE='\033[1;34m'

# Get fastest servers
sudo pacman -S --noconfirm --needed reflector
echo "${BLUE}Getting the fastest servers"
sudo reflector -l 100 -f 50 --sort rate --threads 5 --verbose --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d
echo "${BLUE}The fastest servers found"
cat /etc/pacman.d/mirrorlist
echo "${BLUE}Updating the system"
sudo pacman -Syu
echo "${BLUE}Done updating the system. Setting up..."

# Install my zero config packages
sudo pacman -S --noconfirm --needed curl wget vim htop grep sed bash 

# Install editor, browser and tools
sudo pacman -S --noconfirm --needed google-chrome-stable visual-studio-code
sudo pacman -S --noconfirm --needed vlc transmission-gtk
sudo pacman -S --noconfirm --needed notify-osd arandr tree
sudo pacman -S --noconfirm --needed xorg-server xorg-apps xorg-xinit xorg-xrandr
sudo pacman -S --noconfirm --needed gvfs unrar unzip

# Install theme for desktop and tools
sudo pacman -S --noconfirm --needed thunar xcursor-simpleandsoft lxappearance
sudo pacman -S --noconfirm --needed adapta-gtk-theme papirus-icon-theme

# Install python2 and python3
sudo pacman -S --noconfirm --needed python python2 python-pip python2-pip

# Install pip requirements
sudo pip install virtualenvwrapper docker-compose youtube-dl

# Install golang
sudo pacman -S --noconfirm --needed go go-tools
mkdir -p $HOME/go/{src,bin}

# Install docker
sudo pacman -S --noconfirm --needed docker
sudo systemctl start docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

# Install network manager
sudo pacman -S --noconfirm --needed networkmanager network-manager-applet
sudo systemctl enable networkmanager.service
sudo systemctl start networkmanager.service

# Install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash

# Install cronie for cronjobs
sudo pacman -S --noconfirm --needed cronie
sudo systemctl enable cronie.service
sudo systemctl start cronie.servic

# Install sound and volume
sudo pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pulseaudio-jack pavucontrol
sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins alsa-lib alsa-firmware
sudo pacman -S --noconfirm --needed volumeicon 

# Install bluetooth
sudo pacman -S --noconfirm --needed pulseaudio-bluetooth bluez bluez-libs
sudo pacman -S --noconfirm --needed bluez-utils bluez-firmware blueberry

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl daemon-reload

