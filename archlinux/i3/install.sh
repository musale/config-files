#!/bin/bash
BLUE='\033[1;34m'
I3CONFIG=./i3/config
I3STATUS=./i3/i3status.conf
I3DESKTOP=./i3/desktop.sh
CRONFILE=./i3/wallpaper.cron
XINITRC=./i3/.xinitrc
XRESOURCES=./i3/.Xresources
SED= echo `s/HOME/\"${HOME}\"/g`

sudo pacman -S --noconfirm --needed i3-wm i3blocks i3status i3lock
sudo pacman -S --noconfirm --needed rofi compton deepin-screenshot feh

mkdir -p $HOME/.config/i3
cp $I3CONFIG $HOME/.config/i3/config
cp $I3STATUS $HOME/.config/i3
cp $I3DESKTOP $HOME/.config/i3

sed -Ei $SED $CRONFILE

cat $CRONFILE | crontab -

cp $XINITRC $HOME/.xinitrc
cp $XRESOURCES $HOME/.Xresources

if crontab -l &> /dev/null; then
    echo "${BLUE}Checking for installed wallpaper cron"
    echo `crontab -l`
fi
