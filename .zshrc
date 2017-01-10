#! /bin/zsh
#
# User configuration
########################
#Base16 colors
BASE16_SHELL="$HOME/.colors/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

########################
# Theme
ZSH_THEME="custom"

########################
# Completion
autoload -U compinit && compinit
setopt hist_ignore_space

########################
# Colors
autoload -U colors && colors

########################
# Needed
source /etc/profile

########################
# Set ~/bin priority
export PATH="$HOME/bin:$HOME/.bar:$PATH"

########################
# Sets xfce4-terminal colors to 256
if [[ "$COLORTERM" == "xfce4-terminal" ]]; then
	export TERM=xterm-256color
else
	export TERM=xterm
fi

########################
# Alias
alias ls++='ls++ --potsf'
alias ls='ls++ --potsf'

export NVM_DIR="/home/admin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
