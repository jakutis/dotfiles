# How to install this after installing the linux distribution?

1. `apt-get install sudo git`
2. `git clone git@github.com:jakutis/dotfiles repos/git/dotfiles`
3. `sudo repos/git/dotfiles/bin/install-system $(whoami)`
4. `repos/git/dotfiles/bin/install-user`

# What actions need to be done by hand?

- in `/etc/default/im-config` file set `IM_CONFIG_DEFAULT_MODE=xim`
