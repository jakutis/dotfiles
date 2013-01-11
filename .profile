umask 022

export LD_LIBRARY_PATH="$HOME/opt/cuda/lib64:$HOME/opt/cuda/lib"
export LANG="en_US.UTF-8"
export LC_COLLATE="$LANG"
export LC_CTYPE="$LANG"
export LC_MONETARY="$LANG"
export LC_NUMERIC="$LANG"
export LC_TIME="$LANG"
export LC_MESSAGES="$LANG"
export LC_ALL="$LANG"
export EDITOR="/usr/bin/vim"
export AWT_TOOLKIT="MToolkit"
export SDL_AUDIODRIVER="alsa"
export JAVA_HOME="$HOME/opt/jdk"
export GOROOT="$HOME/opt/go"
export R_LIBS_USER="$HOME/opt/r-site-library"
export CUDA_HOME="$HOME/opt/cuda"
export BROWSER="$HOME/bin/www"
export TEXINPUTS="$TEXINPUTS:$HOME/opt/r/lib/R/share/texmf/tex/latex"
export PYTHONBREW_ROOT="$HOME/.pythonbrew"

if [ -n "$BASH_VERSION" ]; then
  . "$HOME/.bashrc"
fi

PATH="/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

PATH="$HOME/.cabal/bin:$HOME/opt/haskell-platform/bin:$HOME/opt/ghc/bin:$PATH"
PATH="$HOME/.rvm/bin:$PATH"
PATH="$GOROOT/bin:$PATH"
PATH="$HOME/opt/erlang/bin:$PATH"

PATH="$HOME/opt/matlab/bin:$PATH"
PATH="$CUDA_HOME/bin:$PATH"
PATH="$JAVA_HOME/bin:$PATH"
PATH="$HOME/repos/depot_tools:$PATH"

PATH="$HOME/.bin:$HOME/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$PYTHONBREW_ROOT/etc/bashrc" ]] && source "$PYTHONBREW_ROOT/etc/bashrc"
