#!/bin/bash
FONT_AWESOME=./fonts/fontawesome-webfont.ttf
LOCAL_FONT=./fonts/config

cp $FONT_AWESOME $HOME/.fonts/fontawesome-webfont.ttf
sudo cp $LOCAL_FONT /etc/fonts/local.conf
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family noto-fonts-emoji
