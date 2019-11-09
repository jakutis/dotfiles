#!/usr/bin/env bash

cd "$HOME"
xhost localhost
xhost si:localuser:root
xrdb -merge .Xresources
xbindkeys
update-xinput
xscreensaver -no-splash &
xcompmgr &
start-pulseaudio-x11
parcellite &
blueman-applet &
nohup redshift -l 54.68:25.32 -b 1:0.4 -t 6500K:2700K 1>/dev/null 2>&1 &
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
set-background
cd Desktop
i3
