[ -z "$PS1" ] && return

shopt -s histappend
shopt -s checkwinsize
set -o vi

PS1='\u@\h:\w\$ '
HISTCONTROL="ignoreboth"
export HISTFILESIZE=1000000
export HISTSIZE=1000000
if [ "$TERM" = "xterm-256color" ]
then
  export GREP_OPTIONS='--color=auto'
  eval $(dircolors --bourne-shell "$HOME/.dircolors")
else
  if [ "$TERM" = "dumb" ]
  then
    export GREP_OPTIONS='--color=never'
  else
    export GREP_OPTIONS='--color=auto'
    export TERM="rxvt-256color"
    eval $(dircolors --bourne-shell "$HOME/.dircolors")
  fi
fi

export GPG_TTY="$(tty)"

export TERMCAP="$HOME/.termcap"
function settitle() {
        echo -ne "\e]2;$@\a\e]1;$@\a";
}
settitle "$HOSTNAME"
export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

. "$HOME/.bash_aliases"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$PYTHONBREW_ROOT/etc/bashrc" ]] && source "$PYTHONBREW_ROOT/etc/bashrc"
