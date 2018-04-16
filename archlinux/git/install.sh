#!/bin/bash
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
BLUE='\033[1;34m'
NC='\033[0m'
GITCONFIG=$HOME/.gitconfig
CONFIG=$PARENT_PATH/config

sudo pacman -S --noconfirm --needed git
sudo yaourt -S --noconfirm gitflow-avh
echo -e "${BLUE}Creating the git config...${NC}"
cp $CONFIG $GITCONFIG
echo -e "${BLUE}Done creating the git config${NC}"
