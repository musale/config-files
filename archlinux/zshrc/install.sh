#!/bin/bash

echo "Installing zsh..."
sudo pacman -S --noconfirm zsh curl
echo "Done installing zsh. Installing oh-my-zsh..."
curl -L http://install.ohmyz.sh | sh
echo "Done installing oh-my-zsh. Changing shell to zsh..."
chsh -s /bin/zsh
echo "Done changing shell to zsh."
