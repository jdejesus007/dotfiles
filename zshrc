. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

export PATH="$HOME/.rbenv/bin:$PATH"

typeset -U PATH # remove duplicate entries
eval "$(rbenv init - zsh)"

export RBXOPT=-X19