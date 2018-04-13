#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

# https://bugs.launchpad.net/byobu/+bug/1382598
# if [[ "$COLORTERM" == "gnome-terminal" ]] || [[ ${$(</proc/$PPID/cmdline):t} == gnome-terminal* ]]; then
#   export TERM="xterm-256color"
# fi

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

function grt() {
  echo $(git rev-parse --show-toplevel)
}
function G() {
  cd $(grt)
}

export PATH="${PATH}:${HOME}/.local/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/.local/lib"
