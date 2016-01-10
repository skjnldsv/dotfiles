#! /bin/zsh
#
# User configuration
########################
typeset -U path
path=($HOME/.bar $path)
path=($HOME/bin $path)

########################
# Needed Variables
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CURRENT_DESKTOP=gnome
export QT_STYLE_OVERRIDE=gtk

########################
# Set ~/bin priority
export PATH="$HOME/bin:$HOME/.bar:$PATH"

########################
# Default editor
export VISUAL=vim
export EDITOR=$VISUAL