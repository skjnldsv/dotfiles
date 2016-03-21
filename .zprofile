#! /bin/zsh
#
# User configuration
########################
# Set ~/bin priority
export PATH="$HOME/bin:$HOME/.bar:$PATH"

########################
# Import path to systemd
systemctl --user import-environment PATH

########################
# Automatically start X server on tty1
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#source /usr/share/nvm/init-nvm.sh
