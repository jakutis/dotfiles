#!/usr/bin/env bash

cd "$HOME"

DURATION_UNTIL_SCREENSAVER=$(cat "$XDG_CONFIG_HOME/dotfiles/duration-until-screensaver")
export $(dbus-launch)
xhost localhost
xhost si:localuser:root
xrdb -merge .Xresources
xbindkeys
xcompmgr &
xset s default
xset s "$DURATION_UNTIL_SCREENSAVER"
xset +dpms
xset dpms "$DURATION_UNTIL_SCREENSAVER" "$DURATION_UNTIL_SCREENSAVER" "$DURATION_UNTIL_SCREENSAVER"
set-background

ln -nsf "/sys/devices/platform/coretemp.0/hwmon/$(ls -1 "/sys/devices/platform/coretemp.0/hwmon"|head -n1)/temp1_input" "$HOME/.config/dotfiles/temperature"
nohup xautolock -time "$DURATION_UNTIL_SCREENSAVER" -detectsleep -locker lock-screen 1>/dev/null 2>&1 &
start-pulseaudio-x11
parcellite &
blueman-applet &
nohup bash -c 'while true; do sleep 5;[ -n "$(system battery|grep Charging)" ] && continue;A=$(system battery|grep Now|sed -e 's/Now://');[ "$((A))" -lt "$(cat ~/.config/dotfiles/battery_threshold)" ] && zenity --warning --text="Please connect charger, battery low" --no-wrap --timeout=5; done' 1>/dev/null 2>/dev/null &
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
dropbox start &
podcasts &

cd Desktop
i3
