#!/bin/bash
BLUE='\033[1;34m'
NVM_VERSION=0.33.8
ZSH_INSTALL="./zsh/install.sh"
GIT_INSTALL="./git/install.sh"
I3_INSTALL="./i3/install.sh"
TERMINATOR_INSTALL="./terminator/install.sh"

if which pacman &> /dev/null; then
    mkdir -p $HOME/{.config,.fonts,go,Projects,Pictures,Downloads}
    mkdir -p $HOME/Pictures/{Screenshots,Wallpapers}

    sudo pacman -S --noconfirm curl wget vim htop
    # Install python2 and python3
    sudo pacman -S --noconfirm python python2 python-pip python2-pip

    # Install pip requirements
    sudo pip install virtualenvwrapper docker-compose youtube-dl

    # Install golang
    sudo pacman -S --noconfirm go go-tools
    mkdir -p $HOME/go/{src,bin}

    # Install docker
    sudo pacman -S --noconfirm docker
    sudo systemctl start docker.service
    sudo groupadd docker
    sudo usermod -aG docker $USER

    # Install network manager
    sudo pacman -S --noconfirm networkmanager
    sudo systemctl enable networkmanager.service
    sudo systemctl start networkmanager.service
    
    # Install node version manager
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash

    # Install cronie for cronjobs
    sudo pacman -S --noconfirm cronie
    sudo systemctl enable cronie.service
    sudo systemctl start cronie.service

    # Installing scripts
    . $TERMINATOR_INSTALL
    . $I3_INSTALL
    . $GIT_INSTALL
    . $ZSH_INSTALL
fi