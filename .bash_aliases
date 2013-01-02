alias less='less -R'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lha'

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

alias m='matlab -nodisplay'

alias osmo='osmo --config=$HOME/.osmo'

alias umount-ssh='sudo umount -a -t fuse.sshfs'
alias mount-code-ssh='mkdir -p $HOME/mnt/code.fmf.ktu.lt;sshfs -o reconnect tahu@code.fmf.ktu.lt:/ $HOME/mnt/code.fmf.ktu.lt'

alias desktop='wake "$(cat "$HOME/.varia/desktop/network/ip-wake")" "$(cat "$HOME/.varia/desktop/network/mac")";ssh-wrapper -p "$(cat "$HOME/.varia/desktop/network/port")" "$(cat "$HOME/.varia/desktop/network/user")@$(cat "$HOME/.varia/desktop/network/ip")"'
alias mount-desktop-ssh='wake "$(cat "$HOME/.varia/desktop/network/ip-wake")" "$(cat "$HOME/.varia/desktop/network/mac")";mkdir -p $HOME/mnt/desktop-ssh;sshfs -o reconnect -p "$(cat "$HOME/.varia/desktop/network/port")" "$(cat "$HOME/.varia/desktop/network/user")@$(cat "$HOME/.varia/desktop/network/ip"):/" $HOME/mnt/desktop-ssh'

alias server='ssh-wrapper -p 22 tahu@jakut.is'
alias mount-server-ssh='mkdir -p $HOME/mnt/server-ssh;sshfs -o reconnect tahu@jakut.is:/ $HOME/mnt/server-ssh'

alias joyent='ssh-wrapper -p 22 node@8.19.40.202'

function settitle() {
        echo -ne "\e]2;$@\a\e]1;$@\a";
}
#function cd() {
#        command cd "$@";
#        settitle $(basename $(pwd))
#}
#settitle $(basename $(pwd))

alias highlight='highlight --fragment --inline-css'
alias zz='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'
alias p='ps aux|grep -i'
