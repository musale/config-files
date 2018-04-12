#!/bin/bash
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
BLUE='\033[1;34m'
GITCONFIG=$HOME/.gitconfig
CONFIG=$PARENT_PATH/config

sudo pacman -S --noconfirm --needed git
echo -e "${BLUE}Creating the git config..."
cp $CONFIG $GITCONFIG
echo -e "${BLUE}Done creating the git config"
