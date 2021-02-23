#!/usr/bin/env bash

cd "$HOME"
export $(dbus-launch)
xhost localhost
xhost si:localuser:root
xrdb -merge .Xresources
xbindkeys
update-xinput
xset s default
xset s 300
xset +dpms
xset dpms 300 300 300
nohup xautolock -time 600 -detectsleep -locker slock 1>/dev/null 2>&1 &
start-pulseaudio-x11
parcellite &
blueman-applet &
nohup bash -c 'while true; do sleep 5;[ -n "$(system battery|grep Charging)" ] && continue;A=$(system battery|grep Now|sed -e 's/Now://');[ "$((A))" -lt "$(cat ~/.config/dotfiles/battery_threshold)" ] && zenity --warning --text="Please connect charger, battery low" --no-wrap --timeout=5; done' 1>/dev/null 2>/dev/null &
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
dropbox start &
podcasts &
set-background
cd Desktop
i3
