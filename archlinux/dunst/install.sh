#!/bin/bash
DUNST_CONFIG=.config

mkdir -p $HOME/.config/dunst
cp $DUNST_CONFIG $HOME/.config/dunst/dunstrc
notify-send "Done installing dunst for notifications"
