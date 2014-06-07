alias title=settitle

alias ls='ls --color=auto'
alias less='less -R'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls --dereference --all --human-readable -l'
alias l1='ls --almost-all --dereference -1'
alias duf='ls -goR | grep -v ^d | awk "{sum += \$3} END{print sum}"'

alias charge='cat /sys/class/power_supply/$(cat ~/.varia/bat)/energy_now;cat /sys/class/power_supply/$(cat ~/.varia/bat)/status'
alias charge-percent='echo $((($(cat /sys/class/power_supply/$(cat ~/.varia/bat)/energy_now) * 100) / $(cat /sys/class/power_supply/$(cat ~/.varia/bat)/energy_full)))'
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

alias desktop='if ! nc -w 1 -z 78.58.149.106 22;then curl --silent --output /dev/null -u admin "http://78.58.149.106:8080/apply.cgi?current_page=Main_WOL_Content.asp&next_page=Main_WOL_Content.asp&modified=0&action_mode=+Refresh+&preferred_lang=EN&SystemCmd=ether-wake+-i+br0+00%3A18%3Af3%3A44%3Ac9%3A94&firmver=3.0.0.4&destIP=00%3A18%3Af3%3A44%3Ac9%3A94";while ! nc -w 1 -z 78.58.149.106 22;do sleep 1;done;fi;bash ssh-wrapper -p "$(cat "$HOME/.varia/desktop/network/port")" "$(cat "$HOME/.varia/desktop/network/user")@$(cat "$HOME/.varia/desktop/network/ip")"'

alias server='bash ssh-wrapper -p 22 tahu@jakut.is'

alias highlight='highlight --fragment --inline-css'
alias zz='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias p='ps aux|grep -i'
