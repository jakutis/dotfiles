#!/usr/bin/env bash

source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
noblank
LOG_DIR=$HOME/etc/wiki/xwinlogger nohup xwinlogger >/dev/null 2>&1 &

brightness max
system net $(zenity --entry --text="system net ?")
start-pulseaudio-x11

KONQUEROR="$HOME/.varia/instances/konqueror"
URXVT="$HOME/.varia/instances/urxvt"

REFDIR="$HOME/etc/storage/books"

cd "Desktop"
for SPACE in 1M-MAGISTRINIS 2PT-PATIKIMUMOTEORIJA 3SPT-SPRENDIMUPRIEMIMOTEORIJA 4KO-KOMBINATORINISOPTIMIZAVIMAS 5KS-KRIPTOGRAFINESSISTEMOS 6H-HTTPINVOKE 7V-VOYERL 8NRMS-NRMS 9V-VARIA
do
    TAG="$(echo "$SPACE"|sed 's/-.*//')"
    REPO="$(echo "$SPACE"|sed 's/.*-//')"
    cd "$REPO"
    if [ -e "literature" ]
    then
        refs-open "literature" "$REFDIR" "$KONQUEROR/$TAG" &
    fi
    "$URXVT/$TAG" -e vim -S "$HOME/.vimsession/${REPO}.vim" &
    cd ".."
done
cd ".."

awesome
