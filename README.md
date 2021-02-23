# How to install this after installing the linux distribution?

1. `apt-get install sudo git`
2. `git clone git@github.com:jakutis/dotfiles repos/git/dotfiles`
3. `sudo repos/git/dotfiles/bin/install-system $(whoami)`
4. `repos/git/dotfiles/bin/install-user`
5. install Google Chrome
6. configure `$HOME/.config/dotfiles`:
   - `battery`
   - `battery_threshold`
   - `brightness`
   - `dotfiles`
   - `eth`
   - `keyboard`
   - `machine`
   - `wlan`

# What actions need to be done by hand?

- in `/etc/default/im-config` file set `IM_CONFIG_DEFAULT_MODE=xim`

# Recording inactive/unfocused windows

```
vncserver
xtigervncviewer -SecurityTypes VncAuth -passwd /home/jakutis/.vnc/passwd :1 &
ps aux|grep -i ipc-socket
i3-msg -s /run/user/1000/i3/ipc-socket.13187 layout tabbed

export DISPLAY=:1
vokoscreen &
```