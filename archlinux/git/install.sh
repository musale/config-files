#!/bin/bash
BLUE='\033[1;34m'
GITCONFIG=$HOME/.gitconfig
CONFIG=config
sudo pacman -S --noconfirm --needed git
echo "${BLUE}Creating the git config..."
cp $CONFIG $GITCONFIG
echo "${BLUE}Done creating the git config."
