#!/bin/bash

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

numlockx
xsetroot -cursor_name left_ptr

# Wallpaper
/usr/bin/feh --bg-scale ~/.wallpaper

# Android
_JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING

# Icc profile
/usr/bin/xcalib -d :0 "$HOME/.local/share/DisplayCAL/storage/LS27R75 #1 2019-09-22 15-17 120cdm² D6500 2.2 M-S XYZLUT+MTX/LS27R75 #1 2019-09-22 15-17 120cdm² D6500 2.2 M-S XYZLUT+MTX.icc"

# Compositor vsync and tear-free
exec /usr/bin/picom -b &
# Redshift
exec /usr/bin/redshift-gtk &
# Chromium
exec /usr/bin/brave --disk-cache-dir=/tmp/cache &
# Clipboard manager
exec /usr/bin/clipit &
# nextcloud client
exec /usr/bin/nextcloud &
# KeepassX
exec /usr/bin/keepassxc &
# Thunderbird
exec /usr/bin/thunderbird &
# Pomodoro
exec /usr/bin/gnome-pomodoro &
# SysTray
exec stalonetray &

# Bspwm & keyboard shortcuts
exec sxhkd &
exec bspwm
