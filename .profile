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

export LD_LIBRARY_PATH="$HOME/opt/cuda/lib64:$HOME/opt/cuda/lib"

export AWT_TOOLKIT="MToolkit"
export SDL_AUDIODRIVER="alsa"
export LLVM_ROOT="$HOME/opt/llvm"
export JAVA_HOME="$XDG_CONFIG_HOME/dotfiles/java"
export R_HOME="$HOME/opt/r"
export R_LIBS_USER="$HOME/opt/r-site-library"
export CUDA_HOME="$HOME/opt/cuda"
export TEXINPUTS="$TEXINPUTS:$HOME/opt/r/lib/R/share/texmf/tex/latex"
export LOQODIR="$HOME/.bin"
export _JAVA_AWT_WM_NONREPARENTING="1"
export VAGRANT_INSTALLER_ENV="1"
export ACLOCAL_PATH="/usr/share/aclocal"
export ELECTRON_PATH="$HOME/opt/electron/electron"

export BROWSER="$(cat "$XDG_CONFIG_HOME/dotfiles/browser")"
export EDITOR="emacs"

source "$(cat "$XDG_CONFIG_HOME/dotfiles/dotfiles")/.profile.path"

if [ -n "$BASH_VERSION" ]; then
    source "$HOME/.bashrc"
fi

cd "$HOME/Desktop"
