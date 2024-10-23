# Include generic shellrc.
source "$HOME/.shellrc"

try_source /usr/share/doc/pkgfile/command-not-found.bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000



PS1_BASE=''
# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*) PS1_BASE+='\[\e]0;\u@\h: \w\a\]' ;;
	*) ;;
esac

# https://stackoverflow.com/questions/44268582/bash-prompt-w-path-prefixed-with-single-chars-only
function __prompt_get_dir () {
  local path="$PWD"
  path="${path//~/\~}"
  local out=""
  local i=0
  for (( i=0; i<${#path}; i++ )); do
    case "${path:i:1}" in
      \~) out+="${path:i:1}" ;;
      /) out+="${path:i:2}"; continue ;;
      *) continue ;;
    esac
  done
  __abbrev_path="${out:0:-1}${path##*/}"
}

export PROMPT_COMMAND="__prompt_get_dir"

if [ $UID -eq 0 ]; then
	PS1_BASE+='\[\e[31m\]\u@'
else
	PS1_BASE+='\[\e[32m\]'
fi
PS1_BASE+='${HOSTNAME##${SUDO_USER-$USER}-}'
PS1_BASE+='\[\e[m\]'
PS1_BASE+='| '
if [ -n "$HAS_SSHD_ANCESTOR" ]; then
	PS1_BASE+='\[\e[1m\]'
fi
PS1_BASE+='\[\e[0;36m\]$__abbrev_path'
PS1_BASE+='\[\e[33m\] $(__git_ps1 "\[\033[0;37m\]git\[\e[m\]:\[\e[0;32m\]%s\[\e[m\]")'
if [ $UID -eq 0 ]; then
	PS1_BASE+='\[\e[31m\]#\[\e[m\] '
else
	PS1_BASE+='\[\e[m\] '
fi

set -o vi
reset_readline_prompt_mode_strings () {
    eval __prompt_get_dir
    PREPS1=${PS1_BASE@P}
    bind "set vi-cmd-mode-string \"$PREPS1\e[1;31m❮\e[1;33m❮\e[1;32m❮\e[m\""
    bind "set vi-ins-mode-string \"$PREPS1\e[1;31m❯\e[1;33m❯\e[1;32m❯\e[m\""
}
PROMPT_COMMAND=reset_readline_prompt_mode_strings
PS1=' '


# %F{green}%m%f| %F{cyan}${_prompt_sorin_pwd}%f${git_info:+${(e)git_info[prompt]}}%(!. %B%F{red}#%f%b.)${editor_info[keymap]} 


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
    complete -F _command run noout
fi


# Include a local bashrc
[ -f $HOME/.bashrc.local ] && source $HOME/.bashrc.local

###-tns-completion-start-###
if [ -f /home/philtweir/.tnsrc ]; then 
    source /home/philtweir/.tnsrc 
fi
###-tns-completion-end-###
. "$HOME/.cargo/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

complete -C /home/philtweir/.local/bin/mc-2019 mc

alias ls="ls --group-directories-first --color=auto"
. "$HOME/.atuin/bin/env"
eval "$(atuin init bash)"
