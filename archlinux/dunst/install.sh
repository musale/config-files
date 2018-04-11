#!/bin/bash
DUNST_CONFIG=./dunst/.config

sudo pacman -S --noconfirm --needed dunst
mkdir -p $HOME/.config/dunst
cp $DUNST_CONFIG $HOME/.config/dunst/dunstrc
notify-send "Done installing dunst for notifications"
