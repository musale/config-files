#!/bin/bash
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
DUNST_CONFIG=$PARENT_PATH/.config

sudo pacman -S --noconfirm --needed dunst
mkdir -p $HOME/.config/dunst
cp $DUNST_CONFIG $HOME/.config/dunst/dunstrc
notify-send "Done installing dunst for notifications"
