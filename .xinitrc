#!/usr/bin/env bash

source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
noblank
LOG_DIR="$HOME/etc/wiki/xwinlogger" nohup xwinlogger >/dev/null 2>&1 &
system brightness max
system net $(zenity --entry --text="system net ?")
start-pulseaudio-x11

KONQUEROR="$HOME/.varia/instances/konqueror"
URXVT="$HOME/.varia/instances/urxvt"
REFDIR="$HOME/etc/storage/books"
for SPACE in 1V-VARIA 2NRMS-NRMS 3H-HTTPINVOKE
do
    TAG="$(echo "$SPACE"|sed 's/-.*//')"
    REPO="$(echo "$SPACE"|sed 's/.*-//')"
    cd "$HOME/$REPO"
    if [ -e "literature" ]
    then
        refs-open "literature" "$REFDIR" "$KONQUEROR/$TAG" &
    fi
    "$URXVT/$TAG" -e tmus ${REPO} &
    sleep 1
done

cd "$HOME"
klipper
awesome
