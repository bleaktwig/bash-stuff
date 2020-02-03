#!/bin/sh -f

# cd
alias b="cd - > /dev/null"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."

# ls
alias lsa="ls -A"
alias ll="ls -alF"
alias l="ls -CF"
# fix common typos
alias s="ls"
alias sl="ls"
alias LS="ls"

# safety first
alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"

# general utilities
alias intar="tar -czf"
alias untar="tar -xzf"
alias fhere="find . -name"
alias hgrep="history | grep"
alias fswap="sudo swapoff -a && sudo swapon -a"
alias itest="ping google.com -c 1"
alias istest="speedtest"
alias kfranz="killall franz"
alias kslack="killall slack"
alias rkenv="conda activate RK4"
alias bconda="conda deactivate"

# scripts
alias cpcd="echo TODO"
alias mvcd="echo TODO"

# programs
alias ok=okular
alias vvm="~/./linux-programs/visualvm_142/bin/visualvm"
alias idea="~/./linux-programs/idea/bin/idea.sh"
alias tor="~/./linux-programs/tor/start-tor-browser.desktop"
