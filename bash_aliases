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

# scripts
alias cpcd="echo TODO"
alias mvcd="echo TODO"

# python3 is best python
alias python="python3"
alias ipython="ipython3"
alias pip="pip3"

# programs
alias jprof="~/./programs/jprofiler10/bin/jprofiler"
alias idea="~/./programs/idea-IC-183.4886.37/bin/idea.sh"

# JLab related
alias jbld="./build.sh; ./install.sh"
alias jtst="./run.sh; ./test.sh"
alias jrep="./report.sh"
alias cpjson="cpi DC.json coatjava/etc/bankdefs/hipo/;
              cpi DC.json etc/bankdefs/hipo/;
              cpi DC.json common-tools/cnuphys/coatjava/etc/bankdefs/hipo/;"
