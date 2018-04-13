#!/bin/bash
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
BLUE='\033[1;34m'
NC='\033[0m'
I3CONFIG=$PARENT_PATH/config
I3STATUS=$PARENT_PATH/i3status.conf
I3DESKTOP=$PARENT_PATH/desktop.sh
XINITRC=$PARENT_PATH/.xinitrc
XRESOURCES=$PARENT_PATH/.Xresources

CRON="${HOME}/.config/i3/desktop.sh; \
    sleep 20; ${HOME}/.config/i3/desktop.sh; sleep20; \
    ${HOME}/.config/i3/desktop.sh; sleep 20; \
    ${HOME}/.config/i3/desktop.sh;"

echo "* * * * *  $CRON" | crontab -

sudo pacman -S --noconfirm --needed i3-wm i3blocks i3status i3lock
sudo pacman -S --noconfirm --needed rofi compton deepin-screenshot feh

mkdir -p $HOME/.config/i3
cp $I3CONFIG $HOME/.config/i3/config
cp $I3STATUS $HOME/.config/i3
cp $I3DESKTOP $HOME/.config/i3

cp $XINITRC $HOME/.xinitrc
cp $XRESOURCES $HOME/.Xresources

if crontab -l &> /dev/null; then
    echo -e "${BLUE}Checking for installed wallpaper cron ${NC}"
    echo `crontab -l`
fi
