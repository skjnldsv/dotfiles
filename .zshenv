#! /bin/zsh
#
# User configuration
########################
typeset -U path
path=($HOME/bin $path)

########################
# Needed Variables
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_STYLE_OVERRIDE=gtk2
export QT_QPA_PLATFORMTHEME=qt5ct
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

########################
# Set ~/bin priority
export PATH="$HOME/bin:$HOME/.npm-packages/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH"

########################
# Default editor
export VISUAL=vim
export EDITOR=$VISUAL
export SYSTEMD_EDITOR=$VISUAL

########################
# ZSH reset
export ZSH=/home/admin/.oh-my-zsh
export ZSH_CACHE_DIR=$ZSH/cache

########################
# Android studio
export ANDROID_HOME=/home/admin/.android/sdk
