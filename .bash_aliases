alias findlinks='find -type l 2>/dev/null|while read P;do echo "$P -> $(readlink "$P" 2>/dev/null)";done'
alias cdr='. cdr'
alias cdp='. cdp'
alias _calibre='export PATH="$HOME/opt/calibre/bin:$PATH";export LD_LIBRARY_PATH="$HOME/opt/calibre/lib"'
alias s='for A in $(seq 1 100);do echo;done'
alias cd..='cd ..'
alias md='source $HOME/bin/md'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -R'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -l --classify --sort=version --dereference --all --human-readable --'
alias lr='ls -l --classify --sort=time --reverse --dereference --all --human-readable --'
alias l1='ls --almost-all --dereference -1 --'
alias duf='ls -goR | grep -v ^d | awk "{sum += \$3} END{print sum}"'
alias fc='rg --files .'
alias fn='rg --files . | grep -i'
alias grepi='grep -i'
alias fd='fdfind'
alias rg='rg --heading --line-number --color=auto --sort=path'
alias rgi='rg --heading --line-number --color=auto --sort=path --ignore-case'
alias rgp='rg --sort=path -g "!*.md" -g "!*.lock" -g "!*.json" -g "!*.spec.*" -g "!*test*" -g "!*.plantuml"'
alias temp='cat /sys/class/hwmon/hwmon0/temp1_input'
alias fan='$HOME/bin/fan'
alias cpufv='$HOME/bin/cpufv'
alias cpufreq='$HOME/bin/cpufreq'
alias camera='$HOME/bin/camera'
alias cardreader='$HOME/bin/cardreader'
alias bluetooth='$HOME/bin/bluetooth'
alias wlan='$HOME/bin/wlan'
alias brightness='$HOME/bin/brightness'
alias gpull='git pull'
alias grevert='git revert'
alias greset='git reset'
alias gshow='git show'
alias gst='git st'
alias gs='git s'
alias ga='git a'
alias gb='git b'
alias gp='git p'
alias gcp='git cherry-pick'
alias gdiff='git diff'
alias gco='git co'
alias gci='git ci'
alias gclone='git clone'
alias glog='git log'
alias gmerge='git merge'
alias gremote='git remote'
alias grebase='git rebase'
alias gfetch='git fetch'
alias gblame='git blame'
alias gpush='git push'
alias gstash='git stash'
alias gclean='git clean'
alias gbranch='git branch'
alias gtag='git tag'
alias gadd='git add'
alias ghistory='git history'
alias glg='git lg'

alias m='(A=$(mktemp --dry-run);mkfifo $A;matlab -logfile >(tail -n +11|tee $A >/dev/null) -nodisplay > /dev/null;cat $A;rm -rf $A)'

alias osmo='osmo --config=$HOME/.osmo'

alias desktop='wake "$(cat "$HOME/.varia/desktop/network/ip-wake")" "$(cat "$HOME/.varia/desktop/network/mac")" 1>/dev/null;bash ssh-wrapper -p "$(cat "$HOME/.varia/desktop/network/port")" "$(cat "$HOME/.varia/desktop/network/user")@$(cat "$HOME/.varia/desktop/network/ip")"'

alias server='bash ssh-wrapper -p 22 jakutis@vytautasjakutis.com'

alias highlight='highlight --fragment --inline-css'
alias zz='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias p='ps aux|grep -i'
alias timed="stdbuf -i0 -o0 -e0 awk '{now=strftime(\"%F %T%z\t\");sub(/^/, now);print}'"
alias trello="trello-backup ~/Desktop/trello/config.json"
