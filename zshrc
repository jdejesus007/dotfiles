# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python3/libexec/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

#FROM BASH_PROFILE
export SITE_VERSION=$(date +%H)
export GOPATH=$HOME/code/go
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=/Users/jdj/gcloud_apps/protoc-3.7.0-rc-3-osx-x86_64:$PATH:$GOPATH/bin:$GOROOT/bin
export PATH=$PATH:/Users/jdj/flutter/flutter/bin
export PATH=$PATH:/Users/jdj/istio/latest/istio-1.1.0/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN
export ASSET_URL_ROOT=/

# Path to your oh-my-zsh installation.
export ZSH=/Users/jdj/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
alias ll='ls -laG'
alias c='clear'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias glg='git log --all --decorate --oneline --graph'
alias rb='. ~/.zshrc'
alias nproc='sysctl -n hw.ncpu'
alias findreplace='. ~/.dotfiles/custom_scripts/globalfindreplace'
eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jdj/gcloud_apps/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jdj/gcloud_apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jdj/gcloud_apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jdj/gcloud_apps/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/mariadb@10.3/bin:$PATH"

# Add python 3.7 for eb usage
export PATH="/Users/jdj/Library/Python/3.7/bin:$PATH"
