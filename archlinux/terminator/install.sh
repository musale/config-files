#!/bin/bash
BLUE='\033[1;34m'
TERMCONFIG=config

sudo pacman -S --noconfirm terminator
mkdir -p $HOME/.config/terminator
cp TERMCONFIG $/.config/terminator/config
