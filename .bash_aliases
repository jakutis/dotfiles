alias less='less -R'
alias cp='cp -i'
alias mv='mv -i'

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

alias thinkpad='wake "$(cat "$HOME/bin/thinkpad/network/ip-wake")" "$(cat "$HOME/bin/thinkpad/network/mac")";ssh-wrapper -p "$(cat "$HOME/bin/thinkpad/network/port")" "$(cat "$HOME/bin/thinkpad/network/user")@$(cat "$HOME/bin/thinkpad/network/ip")"'
alias thinkpad-kovo11='wake "$(cat "$HOME/bin/thinkpad/network/ip-kovo11-wake")" "$(cat "$HOME/bin/thinkpad/network/mac")";ssh-wrapper -p "$(cat "$HOME/bin/thinkpad/network/port-kovo11")" "$(cat "$HOME/bin/thinkpad/network/user")@$(cat "$HOME/bin/thinkpad/network/ip-kovo11")"'
alias mount-thinkpad-ssh='wake "$(cat "$HOME/bin/thinkpad/network/ip-wake")" "$(cat "$HOME/bin/thinkpad/network/mac")";mkdir -p $HOME/mnt/thinkpad-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/thinkpad/network/port")" "$(cat "$HOME/bin/thinkpad/network/user")@$(cat "$HOME/bin/thinkpad/network/ip"):/" $HOME/mnt/thinkpad-ssh'
alias mount-thinkpad-ssh-kovo11='wake "$(cat "$HOME/bin/thinkpad/network/ip-kovo11-wake")" "$(cat "$HOME/bin/thinkpad/network/mac")";mkdir -p $HOME/mnt/thinkpad-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/thinkpad/network/port-kovo11")" "$(cat "$HOME/bin/thinkpad/network/user")@$(cat "$HOME/bin/thinkpad/network/ip-kovo11"):/" $HOME/mnt/thinkpad-ssh'

alias desktop='wake "$(cat "$HOME/bin/desktop/network/ip-wake")" "$(cat "$HOME/bin/desktop/network/mac")";ssh-wrapper -p "$(cat "$HOME/bin/desktop/network/port")" "$(cat "$HOME/bin/desktop/network/user")@$(cat "$HOME/bin/desktop/network/ip")"'
alias desktop-kovo11='wake "$(cat "$HOME/bin/desktop/network/ip-kovo11-wake")" "$(cat "$HOME/bin/desktop/network/mac")";ssh-wrapper -p "$(cat "$HOME/bin/desktop/network/port-kovo11")" "$(cat "$HOME/bin/desktop/network/user")@$(cat "$HOME/bin/desktop/network/ip-kovo11")"'
alias mount-desktop-ssh='wake "$(cat "$HOME/bin/desktop/network/ip-wake")" "$(cat "$HOME/bin/desktop/network/mac")";mkdir -p $HOME/mnt/desktop-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/desktop/network/port")" "$(cat "$HOME/bin/desktop/network/user")@$(cat "$HOME/bin/desktop/network/ip"):/" $HOME/mnt/desktop-ssh'
alias mount-desktop-ssh-kovo11='wake "$(cat "$HOME/bin/desktop/network/ip-kovo11-wake")" "$(cat "$HOME/bin/desktop/network/mac")";mkdir -p $HOME/mnt/desktop-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/desktop/network/port-kovo11")" "$(cat "$HOME/bin/desktop/network/user")@$(cat "$HOME/bin/desktop/network/ip-kovo11"):/" $HOME/mnt/desktop-ssh'

alias laptop='wake "$(cat "$HOME/bin/laptop/network/ip-wake")" "$(cat "$HOME/bin/laptop/network/mac")";ssh-wrapper -p "$(cat "$HOME/bin/laptop/network/port")" "$(cat "$HOME/bin/laptop/network/user")@$(cat "$HOME/bin/laptop/network/ip")"'
alias laptop-kovo11='wake "$(cat "$HOME/bin/laptop/network/ip-kovo11-wake")" "$(cat "$HOME/bin/laptop/network/mac")";ssh-wrapper -p "$(cat "$HOME/bin/laptop/network/port-kovo11")" "$(cat "$HOME/bin/laptop/network/user")@$(cat "$HOME/bin/laptop/network/ip-kovo11")"'
alias mount-laptop-ssh='mkdir -p $HOME/mnt/laptop-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/laptop/network/port")" "$(cat "$HOME/bin/laptop/network/user")@$(cat "$HOME/bin/laptop/network/ip"):/" $HOME/mnt/laptop-ssh'
alias mount-laptop-ssh-kovo11='mkdir -p $HOME/mnt/laptop-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/laptop/network/port-kovo11")" "$(cat "$HOME/bin/laptop/network/user")@$(cat "$HOME/bin/laptop/network/ip-kovo11"):/" $HOME/mnt/laptop-ssh'

alias communicator='ssh-wrapper -p "$(cat "$HOME/bin/communicator/network/port")" "$(cat "$HOME/bin/communicator/network/user")@$(cat "$HOME/bin/communicator/network/ip")"'
alias mount-communicator-ssh='mkdir -p $HOME/mnt/communicator-ssh;sshfs -o reconnect -p "$(cat "$HOME/bin/communicator/network/port")" "$(cat "$HOME/bin/communicator/network/user")@$(cat "$HOME/bin/communicator/network/ip"):/" $HOME/mnt/communicator-ssh'

alias server='ssh-wrapper -p 22 tahu@jakut.is'
alias mount-server-ssh='mkdir -p $HOME/mnt/server-ssh;sshfs -o reconnect tahu@jakut.is:/ $HOME/mnt/server-ssh'
alias mount-server-ftp='mkdir -p $HOME/mnt/server-ftp;curlftpfs -o user=tahu,ssl,tlsv1 jakut.is $HOME/mnt/server-ftp'

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
