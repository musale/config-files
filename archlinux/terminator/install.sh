#!/bin/bash
BLUE='\033[1;34m'
TERMCONFIG=./terminator/config

sudo pacman -S --noconfirm --needed terminator
mkdir -p $HOME/.config/terminator
cp $TERMCONFIG $/.config/terminator/config
echo "${BLUE}Done installing and setting up terminator"
