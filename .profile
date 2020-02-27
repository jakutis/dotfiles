umask 022

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"

MACHINE="$(cat "$XDG_CONFIG_HOME/dotfiles/machine")"

export LANG="en_US.UTF-8"
export LC_COLLATE="$LANG"
export LC_CTYPE="$LANG"
export LC_MONETARY="$LANG"
export LC_NUMERIC="$LANG"
export LC_TIME="$LANG"
export LC_MESSAGES="$LANG"
export LC_ALL="$LANG"

export PYENV_ROOT="$HOME/.pyenv"
export GVM_ROOT="$HOME/.gvm"
export PERLBREW_ROOT="$HOME/.perl5"
export BAT_CONFIG_PATH="$(cat "$XDG_CONFIG_HOME/dotfiles/dotfiles")/bat.conf"
export FZF_DEFAULT_COMMAND='rg --files'
export AWT_TOOLKIT="MToolkit"
export SDL_AUDIODRIVER="alsa"
export R_LIBS_USER="$HOME/opt/r-site-library"
export LOQODIR="$HOME/.bin"
export _JAVA_AWT_WM_NONREPARENTING="1"
export VAGRANT_INSTALLER_ENV="1"
export ACLOCAL_PATH="/usr/share/aclocal"

export BROWSER="$(cat "$XDG_CONFIG_HOME/dotfiles/browser")"
export EDITOR="vim"

export PATH="$HOME/.bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ -n "$BASH_VERSION" ]; then
    source "$HOME/.bashrc"
fi

cd "$HOME/Desktop"
