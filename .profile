umask 022

MACHINE="$(cat "$HOME/.varia/machine")"
export LD_LIBRARY_PATH="$HOME/opt/cuda/lib64:$HOME/opt/cuda/lib"
if [ -n "$(locale --all-locales | grep 'C.utf8')" ]
then
	export LANG="C.UTF-8"
elif [ -n "$(locale --all-locales | grep 'en_US.utf8')" ]
then
	export LANG="en_US.UTF-8"
else
	export LANG="$(locale --all-locales | head -n 1)"
fi
export LANG="en_US.UTF-8"
export LC_COLLATE="$LANG"
export LC_CTYPE="$LANG"
export LC_MONETARY="$LANG"
export LC_NUMERIC="$LANG"
export LC_TIME="$LANG"
export LC_MESSAGES="$LANG"
export LC_ALL="$LANG"
export AWT_TOOLKIT="MToolkit"
export SDL_AUDIODRIVER="alsa"
export LLVM_ROOT="$HOME/opt/llvm"
export JAVA_HOME="$HOME/opt/jdk"
export R_LIBS_USER="$HOME/opt/r-site-library"
export CUDA_HOME="$HOME/opt/cuda"
if [ "$MACHINE" = "wix" ]
then
    export BROWSER="www"
else
    export BROWSER="firefox"
fi
export TEXINPUTS="$TEXINPUTS:$HOME/opt/r/lib/R/share/texmf/tex/latex"
export LOQODIR="$HOME/.bin"
export _JAVA_AWT_WM_NONREPARENTING="1"
export VAGRANT_INSTALLER_ENV="1"
export ACLOCAL_PATH="/usr/share/aclocal"
source "$HOME/Desktop/DOTFILES/.profile.path"
export EDITOR="$(which vim)"

if [ -n "$BASH_VERSION" ]; then
    source "$HOME/.bashrc"
fi
