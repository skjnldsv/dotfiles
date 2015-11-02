#! /bin/zsh
#
# User configuration
########################
# Set ~/bin priority
export PATH="$HOME/bin:$HOME/.bar:$PATH"

########################
# Automatically start X server on tty1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx