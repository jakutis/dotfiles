alias nu='source ~/.nvm/nvm.sh && nvm use && eval "$(pyenv init -)" && pyenv shell system'
alias po='pomodoro pomodoro'
alias pst='pomodoro status'
alias pin='pomodoro interruption'
alias plo='pomodoro longbreak'
alias psh='pomodoro shortbreak'
alias s='system'
alias cd..='cd ..'
alias md='source $HOME/bin/md'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less -R'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l --sort=time --reverse --dereference --all --human-readable --'
alias l1='ls --almost-all --dereference -1 --'
alias duf='ls -goR | grep -v ^d | awk "{sum += \$3} END{print sum}"'
alias fc='rg --files . '
alias fn='rg --files . | grep -i '
alias temp='cat /sys/class/hwmon/hwmon0/temp1_input'
alias fan='$HOME/bin/fan'
alias cpufv='$HOME/bin/cpufv'
alias cpufreq='$HOME/bin/cpufreq'
alias camera='$HOME/bin/camera'
alias cardreader='$HOME/bin/cardreader'
alias bluetooth='$HOME/bin/bluetooth'
alias wlan='$HOME/bin/wlan'
alias brightness='$HOME/bin/brightness'

alias m='(A=$(mktemp --dry-run);mkfifo $A;matlab -logfile >(tail -n +11|tee $A >/dev/null) -nodisplay > /dev/null;cat $A;rm -rf $A)'

alias osmo='osmo --config=$HOME/.osmo'

alias desktop='wake "$(cat "$HOME/.varia/desktop/network/ip-wake")" "$(cat "$HOME/.varia/desktop/network/mac")" 1>/dev/null;bash ssh-wrapper -p "$(cat "$HOME/.varia/desktop/network/port")" "$(cat "$HOME/.varia/desktop/network/user")@$(cat "$HOME/.varia/desktop/network/ip")"'

alias server='bash ssh-wrapper -p 22 jakutis@vytautasjakutis.com'

alias highlight='highlight --fragment --inline-css'
alias zz='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias p='ps aux|grep -i'
alias timed="stdbuf -i0 -o0 -e0 awk '{now=strftime(\"%F %T%z\t\");sub(/^/, now);print}'"
alias youtube-dl="youtube-dl --prefer-ffmpeg"
alias trello="trello-backup ~/Desktop/trello/config.json"
alias tailf="tail -f"
