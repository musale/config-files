export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="theunraveler"
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/bin/virtualenvwrapper.sh

# VirtualBox settings
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# RVM settings
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# GO settings
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# aliases
alias pac="sudo pacman --noconfirm"
alias pack="packer -S --noconfirm --noedit"
alias add-all="git add ."
alias add="git add -p"
alias commit="git commit -m"
alias vimzsh="vim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias dsa="docker stop $(docker ps -a -q)"
alias dra="docker rm $(docker ps -a -q)"
alias ydl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --yes-playlist -i --download-archive $HOME/.youtube.txt"
alias ydlmp3="youtube-dl --extract-audio --audio-format mp3 --yes-playlist -i -c --download-archive $HOME/.youtube.txt"
alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
alias wifi="nmcli device wifi list"
alias re-zuku="nmcli device wifi connect 'ZUKU' password zuku4321"
alias re-pluto="nmcli device wifi connect 'Pluto' password iknowican001"
alias re-contessa="nmcli device wifi connect 'Contessa' password Bartowski"
alias re-hei="nmcli device wifi connect 'Heisenberg' password Plastics\&1"
alias re-omsk="nmcli device wifi connect 'omsk' password choulot@345#"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
