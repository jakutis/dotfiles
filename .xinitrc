#!/usr/bin/env bash

source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
xbindkeys
noblank
#xflux -l 54.9279 -g 23.8774 -k 2000
LOG_DIR=$HOME/etc/wiki/xwinlogger nohup xwinlogger >/dev/null 2>&1 &

laptop net "$(zenity --entry --text="laptop net ?")"

QPDFVIEW="/home/tahu/.varia/instances/qpdfview"
URXVT="/home/tahu/.varia/instances/urxvt"
FIREFOX="/home/tahu/.varia/instances/firefox"
GOOGLECHROME="/home/tahu/.varia/instances/google-chrome"

REFDIR="/home/tahu/etc/storage/books"

cd /home/tahu/Desktop/MAGISTRINIS
refs-open /home/tahu/Desktop/MAGISTRINIS/literature "$REFDIR" "$QPDFVIEW/M" &
"$URXVT/M" -e vim -S &
cd

cd /home/tahu/Desktop/DAUGIAMATESTATISTINEANALIZE
refs-open /home/tahu/Desktop/DAUGIAMATESTATISTINEANALIZE/literature "$REFDIR" "$QPDFVIEW/DSA" &
"$URXVT/DSA" -e vim -S &
cd /home/tahu/etc/storage/repositories/DAUGIAMATESTATISTINEANALIZE
"$URXVT/DSA" &
"$QPDFVIEW/DSA" *.pdf &
cd

cd /home/tahu/Desktop/STOCHASTINIAIEKSTREMUMAIIRSUMOS
refs-open /home/tahu/Desktop/STOCHASTINIAIEKSTREMUMAIIRSUMOS/literature "$REFDIR" "$QPDFVIEW/SEIS" &
"$URXVT/SEIS" -e vim -S &
cd /home/tahu/etc/storage/repositories/STOCHASTINIAIEKSTREMUMAIIRSUMOS
"$URXVT/SEIS" &
"$QPDFVIEW/SEIS" *.pdf &
cd

cd /home/tahu/Desktop/ALGEBRINETIESINIUOPERATORIUANALIZE
refs-open /home/tahu/Desktop/ALGEBRINETIESINIUOPERATORIUANALIZE/literature "$REFDIR" "$QPDFVIEW/ATOA" &
"$URXVT/ATOA" -e vim -S &
cd /home/tahu/etc/storage/repositories/ALGEBRINETIESINIUOPERATORIUANALIZE
"$URXVT/ATOA" &
"$QPDFVIEW/ATOA" *.pdf &
cd

cd /home/tahu/Desktop/NRMS/apps/nrms_web/priv/js
"$URXVT/NRMS" &
cd
"$GOOGLECHROME/NRMS" &

"$URXVT/VARIA" -e mosh --server=/home/tahu/opt/mosh/bin/mosh-server jakut.is ./.bin/tmuxcom &
cd "$HOME/etc/wiki"
"$URXVT/VARIA" -e vim -S &
cd

awesome
