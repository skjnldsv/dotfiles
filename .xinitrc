#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Gnome keyring

numlockx
xsetroot -cursor_name left_ptr

#Wallpaper
/usr/bin/feh --bg-scale ~/.wallpaper

#Android
_JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING

# Nvidia hack
nvidia-settings -a GpuPowerMizerMode=1

# Compositor vsync and tear-free
exec /usr/bin/compton --config .config/compton.conf -b &
# Redshift
exec /usr/bin/redshift-gtk &
# Chromium
exec /usr/bin/chromium --disk-cache-dir=/tmp/cache &
# Clipboard manager
exec /usr/bin/clipit &
# nextcloud client
exec /usr/bin/nextcloud &
# KeepassX
exec /usr/bin/keepassx2 &
# Hexchat
exec /usr/bin/hexchat &
# Thunderbird
exec /usr/bin/thunderbird &
# Pomodoro
exec /usr/bin/gnome-pomodoro &
# SysTray
exec /usr/bin/trayer --widthtype request --align right --edge top --height 20 --distance 42 --transparent true --alpha 255 --padding 0 &

# Bspwm & keyboard shortcuts
exec sxhkd &
exec bspwm
