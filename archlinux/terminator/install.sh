#!/bin/bash
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
BLUE='\033[1;34m'
NC='\033[0m'

TERMCONFIG=$PARENT_PATH/config

sudo pacman -S --noconfirm --needed terminator
mkdir -p $HOME/.config/terminator
cp $TERMCONFIG $HOME/.config/terminator/config
echo -e "${BLUE}Done installing and setting up terminator${NC}"
