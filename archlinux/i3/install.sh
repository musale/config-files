#!/bin/bash
BLUE='\033[1;34m'
I3CONFIG=config
I3STATUS=i3status.conf
I3DESKTOP=desktop.sh
CRONFILE=wallpaper.cron
CRON=`cat $CRONFILE`
HOME=`echo $HOME`
XINITRC=.xinitrc
XRESOURCES=.Xresources

sudo pacman -S --noconfirm i3 rofi

mkdir -p $HOME/.config/i3
cp $I3CONFIG $HOME/.config/i3/config
cp $I3STATUS $HOME/.config/i3
cp $I3DESKTOP $HOME/.config/i3

sed -Ei 's/HOME/$HOME/g' $CRONFILE
cat $CRONFILE | crontab -

if crontab -l &> /dev/null; then
    echo "${BLUE}Checking for installed wallpaper cron"
    echo `crontab -l`
fi

cp $XINITRC $HOME/.xinitrc
cp $XRESOURCES $HOME/.Xresources
