umask 022

#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/opt/MATLAB_Runtime/v910/runtime/glnxa64:$HOME/opt/MATLAB_Runtime/v910/bin/glnxa64:$HOME/opt/MATLAB_Runtime/v910/sys/os/glnxa64:$HOME/opt/MATLAB_Runtime/v910/extern/bin/glnxa64"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"

MACHINE="$(cat "$XDG_CONFIG_HOME/dotfiles/machine")"

export LANG="en_IE.UTF-8"
export LC_ADDRESS="lt_LT.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_IDENTIFICATION="$LANG"
export LC_MEASUREMENT="lt_LT.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="lt_LT.UTF-8"
export LC_NAME="lt_LT.UTF-8"
export LC_NUMERIC="en_IE.UTF-8"
export LC_PAPER="lt_LT.UTF-8"
export LC_TELEPHONE="lt_LT.UTF-8"
export LC_TIME="en_IE.UTF-8"

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
export DSTAT_OPTS="--nocolor"
export GTK_THEME="Adwaita:dark"

export BROWSER="www"
export EDITOR="vim"
if [ "$(vim --version|head -n1|cut -f 1 -d ' ')" = "NVIM" ]
then
  export MANPAGER="vim +Man!"
else
  export MANPAGER="vim -c 'set nonumber' -c MANPAGER -"
fi

export PATH="$HOME/.bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ -n "$BASH_VERSION" ]
then
    source "$HOME/.bashrc"
fi

if [ -e "$HOME/.profile.private" ]
then
    source "$HOME/.profile.private"
fi

cd "$HOME/Desktop"
