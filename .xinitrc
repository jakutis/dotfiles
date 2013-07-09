#!/usr/bin/env bash

source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
xbindkeys
noblank
#xflux -l 54.9279 -g 23.8774 -k 2000
LOG_DIR=$HOME/etc/wiki/xwinlogger nohup xwinlogger >/dev/null 2>&1 &

laptop net $(zenity --entry --text="laptop net ?")

OSMO="/home/tahu/.varia/instances/osmo"
QPDFVIEW="/home/tahu/.varia/instances/qpdfview"
URXVT="/home/tahu/.varia/instances/urxvt"
FIREFOX="/home/tahu/.varia/instances/firefox"

REFDIR="/home/tahu/etc/storage/books"

cd /home/tahu/Desktop/MAGISTRINIS
refs-open /home/tahu/Desktop/MAGISTRINIS/literature "$REFDIR" "$QPDFVIEW/M" &
"$URXVT/M" -e vim -S "$HOME/.vimsession/MAGISTRINIS.vim" &
cd

cd /home/tahu/Desktop/NRMS/apps/nrms_web/priv/js
"$URXVT/NRMS" -e vim -S "$HOME/.vimsession/NRMS.vim" &
cd

"$VARIA/osmo" &
"$URXVT/VARIA" -e mosh --server=/home/tahu/opt/mosh/bin/mosh-server jakut.is ./.bin/tmuxcom &
cd "$HOME/etc/wiki"
"$URXVT/VARIA" -e vim -S "$HOME/.vimsession/VARIA.vim" &
cd

awesome
