#!/usr/bin/env bash

source .profile

export XDG_SESSION_TYPE=x11
unset WAYLAND_DISPLAY
dbus-update-activation-environment --systemd XDG_SESSION_TYPE=x11
dbus-update-activation-environment --systemd WAYLAND_DISPLAY

cd "$HOME"
source .xinitrc