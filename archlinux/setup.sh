#!/bin/bash
BLUE='\033[1;34m'
ZSH_INSTALL="./zsh/install.sh"
GIT_INSTALL="./git/install.sh"

if which pacman &> /dev/null; then
    sudo pacman -S --noconfirm curl wget
    # Install python2 and python3
    sudo pacman -S --noconfirm python python2 python-pip python2-pip

    # Install pip requirements
    sudo pip install virtualenvwrapper docker-compose

    # Install golang
    sudo pacman -S --noconfirm go go-tools
    mkdir -p $HOME/go
    mkdir -p $HOME/go/{src,bin}
    
    # Installing git
    . $GIT_INSTALL
    . $ZSH_INSTALL
fi