#!/bin/bash
FONT_AWESOME=fontawesome-webfont.ttf
LOCAL_FONT=config

cp $FONT_AWESOME $HOME/.fonts/fontawesome-webfont.ttf
sudo cp $LOCAL_FONT /etc/fonts/local.conf
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family ttf-fira-code noto-fonts-emoji
