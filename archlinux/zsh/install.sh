#!/bin/bash
BLUE='\033[1;34m'
NC='\033[0m'

echo -e "${BLUE}Installing zsh...${NC}"
sudo pacman -S --noconfirm --needed zsh
echo -e "${BLUE}Done installing zsh. Installing oh-my-zsh...${NC}"
curl -L http://install.ohmyz.sh | sh
echo -e "${BLUE}Done installing oh-my-zsh. Changing shell to zsh...${NC}"
cp ./zsh/.zshrc $HOME/.zshrc
chsh -s /bin/zsh
echo -e "${BLUE}Done changing shell to zsh${NC}"
