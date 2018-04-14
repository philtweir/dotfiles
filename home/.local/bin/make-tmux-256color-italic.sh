#!/bin/sh

rm -f /tmp/tmux-256color-italic.terminfo
infocmp tmux | sed -e 's/^tmux[^|]*|[^,]*,/tmux-256color-italic|screen with italics support,/' -e 's/%?%p1%t;3%/%?%p1%t;7%/' -e 's/smso=[^,]*,/smso=\E[7m,/' -e 's/rmso=[^,]*,/rmso=\E[27m,/' -e '$s/$/ sitm=\E[3m, ritm=\E[23m,/' > /tmp/tmux-256color-italic.terminfo
tic /tmp/tmux-256color-italic.terminfo
