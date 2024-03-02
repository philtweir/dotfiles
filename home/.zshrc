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

export PATH="${HOME}/.local/bin:${PATH}:$HOME/.config/composer/vendor/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/.local/lib"
export EDITOR="vi"

###-tns-completion-start-###
if [ -f /home/philtweir/.tnsrc ]; then 
    source /home/philtweir/.tnsrc 
fi
###-tns-completion-end-###

PATH="/home/philtweir/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/philtweir/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/philtweir/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/philtweir/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/philtweir/perl5"; export PERL_MM_OPT;

eval "$(atuin init zsh --disable-up-arrow)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/philtweir/.local/bin/mc-2019 mc
