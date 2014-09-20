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

export PATH="${PATH}:${HOME}/.local/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/.local/lib"
