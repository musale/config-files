#!/bin/bash
BLUE='\033[1;34m'
GITCONFIG=$HOME/.gitconfig
echo "${BLUE}Creating the git config..."
cp config GITCONFIG
echo "${BLUE}Done creating the git config."