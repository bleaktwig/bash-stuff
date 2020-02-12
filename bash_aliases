#!/bin/sh -f

# cd (TODO: I feel that this could be easily improved)
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
# fix common ls typos
alias s="ls"
alias sl="ls"
alias LS="ls"

# safety first
alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"

# general utilities
alias c="clear"
alias e="exit"
alias intar="tar -czf"
alias untar="tar -xzf"
alias fhere="find . -name"
alias hgrep="history | grep"
alias fswap="sudo swapoff -a && sudo swapon -a"
alias itest="ping google.com -c 1"
alias istest="speedtest"

# Displaying free and used space.
alias dfree='df -h'
alias dused='du -sh'

# faster dir switching.
mkcd() {
    mkdir "$@" || return
    shift "$(( $# - 1 ))"
    cd -- "$1"
}
mvcd() {
    mv "$@" || return
    shift "$(( $# - 1 ))"
    cd -- "$1"
}
cpcd() {
    cp "$@" || return
    shift "$(( $# - 1 ))"
    cd -- "$1"
}

# mighty extract function.
extract() {
    if [[ -f $1 ]] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)  echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# programs
alias ok=okular
alias gemc="sudo docker run -it --rm -v /home/twig/code/gemc/jlab:/jlab/work/benkel jeffersonlab/gemcbatch:2.7 bash"
alias gemc_browser="sudo docker run -it --rm -p 6080:6080 -v /home/twig/code/gemc/jlab:/jlab/work/benkel jeffersonlab/gemcinteractive:2.7"
