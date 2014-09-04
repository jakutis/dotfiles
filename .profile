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
export PYENV_ROOT="$HOME/.pyenv"
export GVM_ROOT="$HOME/.gvm"
export PERLBREW_ROOT="$HOME/.perl5"
export LOQODIR="$HOME/.bin"
export _JAVA_AWT_WM_NONREPARENTING="1"
export VAGRANT_INSTALLER_ENV="1"
export ACLOCAL_PATH="/usr/share/aclocal"

PATH="/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/lib/mutt"

PATH="$HOME/opt/ghc/bin:$PATH"
PATH="$HOME/.rvm/bin:$PATH"
PATH="$HOME/opt/erlang/bin:$PATH"

PATH="$HOME/opt/matlab/bin:$PATH"
PATH="$HOME/opt/calibre:$PATH"
PATH="$HOME/opt/mysql/bin:$PATH"
PATH="$CUDA_HOME/bin:$PATH"
PATH="$JAVA_HOME/bin:$PATH"
PATH="$LLVM_ROOT/bin:$PATH"
PATH="$PYENV_ROOT/bin:$PATH"

PATH="$HOME/.bin:$HOME/bin:$PATH"

export EDITOR="$(which vim)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && rvm default 2>/dev/null
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh" && nvm use default 1>/dev/null
[[ -s "$PYENV_ROOT" ]] && eval "$(pyenv init -)" && pyenv shell "$(cat "$(pyenv version-file)")"
[[ -s "$PERLBREW_ROOT/etc/bashrc" ]] && source "$PERLBREW_ROOT/etc/bashrc" && perlbrew use default
[[ -s "$GVM_ROOT/scripts/gvm-default" ]] && source "$GVM_ROOT/scripts/gvm-default" && gvm use default 1>/dev/null
[[ -s "$HOME/opt/php-version/php-version.sh" ]] && source "$HOME/opt/php-version/php-version.sh" && php-version "$(cat "$HOME/.php")"

if [ -n "$BASH_VERSION" ]; then
    source "$HOME/.bashrc"
fi
