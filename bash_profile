export SITE_VERSION=$(date +%H)
export PATH=$PATH:/usr/bin/local
export ASSET_URL_ROOT=/

export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN

alias ll='ls -laG'
alias c='clear'
alias v='vim'
alias vi='vim'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gch='git checkout'
alias gd='git diff'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias rb='. ~/.bash_profile'
eval "$(thefuck --alias)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

