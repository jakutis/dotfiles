#!/usr/bin/env bash

source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
xbindkeys
noblank
xflux -l 54.9279 -g 23.8774 -k 2000
LOG_DIR=$HOME/etc/wiki/xwinlogger nohup xwinlogger >/dev/null 2>&1 &

brightness max
system net $(zenity --entry --text="system net ?")

KONQUEROR="/home/tahu/.varia/instances/konqueror"
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
        refs-open "literature" "$REFDIR" "$KONQUEROR/$TAG" &
    fi
    "$URXVT/$TAG" -e vim -S "$HOME/.vimsession/${REPO}.vim" &
    cd ".."
done
cd ".."

"$VARIA/osmo" &
su -c "pulseaudio -n --system --disallow-module-loading --disallow-exit --realtime --load=module-device-restore --load=module-stream-restore --load=module-card-restore --load=module-alsa-sink --load=module-alsa-source --load=module-native-protocol-unix --daemon"
(dropboxd &)&
awesome
