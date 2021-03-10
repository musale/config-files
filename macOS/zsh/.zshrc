export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH:/usr/local/go/bin:$HOME/.composer/vendor/bin

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

ZSH_THEME="spaceship"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  poetry
)

source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh-completions $fpath)

# Functions
# --- Which process is running on a given port? ---
whoseport () {
 lsof -i ":$1" | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} LISTEN
}

# --- What is the weather? ---
weather(){ curl -s "wttr.in/$1?m1"}

# --- Go back n number of directories ---
function up() {
  times=$1
  while [ "$times" -gt "0" ]; do
    cd ..
    times=$(($times - 1))
  done
}

# --- Time the zsh shell ---
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# --- ALIASES ---
alias speed="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias killport="sudo kill -9"

# -- GitHub --
alias commit="git commit -m"
alias add="git add -p"
alias ga="git add ."
alias gpm="git push origin master"
alias gpu="git push upstream master"
alias update="git fetch upstream && git merge upstream/master && git push origin master"
alias gpo="git push origin"
alias pullmaster="git pull origin master --rebase"

# -- Shorter commands for `Homebrew` --
alias brewd="brew doctor"
alias brewi="brew install"
alias brewr="brew uninstall"
alias brews="brew search"
alias brewu="brew update \
                && brew upgrade \
                && brew cleanup \
                && brew cask upgrade"

# -- OS --
alias again="sudo!!"
alias cd..="cd .."
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias ip="curl ipinfo.io/ip"

# -- Golang --
alias gosrc="cd $HOME/go/src"
alias gobin="cd $HOME/go/bin"

# -- Docker --
DOCKER_STATE=$(docker info >/dev/null 2>&1)
if [[ $? -eq 0 ]]; then
  alias dstop="docker stop $(docker ps -aq)"
  alias drm="docker rm $(docker ps -aq)"
  alias drmi="docker rmi $(docker ps -aq)"
  # -- Kubernetes -- 
  alias kc="kubectl create -f"
  alias kg="kubectl get"
  alias kd="kubectl delete"
else
  echo "Docker is not running."
fi

# -- YouTube-dl --
alias ydl="pipenv run youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --yes-playlist -i --download-archive $HOME/.youtube.txt"
alias ydlmp3="pipenv run youtube-dl --extract-audio --audio-format mp3 --yes-playlist -i -c --download-archive $HOME/.youtube.txt"

# -- Chrome --
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias copen="open -a 'Google Chrome'"

# -- ZSH --
alias vimzsh="nvim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias codezsh="code ~/.zshrc"
alias catzsh="cat ~/.zshrc"

# -- NeoVim --
alias nvimconf="nvim ~/.config/nvim/init.vim"

# -- NVM --
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
