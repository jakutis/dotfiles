source "$HOME/.profile"
xhost localhost
xrdb -merge "$HOME/.Xresources"
update-xinput
xbindkeys
noblank
#xflux -l 54.9279 -g 23.8774 -k 2000
LOG_DIR=$HOME/etc/wiki/xwinlogger nohup xwinlogger >/dev/null 2>&1 &
awesome
