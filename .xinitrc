#!/usr/bin/env bash

source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
xbindkeys
noblank
xflux -l 54.9279 -g 23.8774 -k 2000
LOG_DIR=$HOME/etc/wiki/xwinlogger nohup xwinlogger >/dev/null 2>&1 &

laptop net $(zenity --entry --text="laptop net ?")

QPDFVIEW="/home/tahu/.varia/instances/qpdfview"
URXVT="/home/tahu/.varia/instances/urxvt"

REFDIR="/home/tahu/etc/storage/books"

cd "Desktop"
for SPACE in 1M-MAGISTRINIS 2PT-PATIKIMUMOTEORIJA 3SPT-SPRENDIMUPRIEMIMOTEORIJA 4KO-KOMBINATORINISOPTIMIZAVIMAS 5KS-KRIPTOGRAFINESSISTEMOS 6H-HTTPINVOKE 7V-VOYERL 8NRMS-NRMS 9V-VARIA
do
    TAG="$(echo "$SPACE"|sed 's/-.*//')"
    REPO="$(echo "$SPACE"|sed 's/.*-//')"
    cd "$REPO"
    if [ -e "literature" ]
    then
        refs-open "literature" "$REFDIR" "$QPDFVIEW/$TAG" &
    fi
    "$URXVT/$TAG" -e vim -S "$HOME/.vimsession/${REPO}.vim" &
    cd ".."
done
cd ".."

"$VARIA/osmo" &
awesome
