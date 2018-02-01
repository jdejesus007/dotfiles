. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

export PATH="$HOME/.rbenv/bin:$PATH"

typeset -U PATH # remove duplicate entries


# added by travis gem
[ -f /Users/kayle/.travis/travis.sh ] && source /Users/kayle/.travis/travis.sh

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete
