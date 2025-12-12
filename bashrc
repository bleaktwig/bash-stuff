# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# --+ Setup +-------------------------------------------------------------------
# History setup.
export HISTFILESIZE=1000000 # History file size.
export HISTSIZE=1000000     # History file length.
HISTCONTROL=ignoreboth      # Don't put duplicate lines in history.
shopt -s histappend         # Append to history, don't overwrite.

# Update LINES and COLUMNS to window size.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Avoid accidental overwriting.
set -o noclobber # Don't overwrite by default.
alias cp="cp -i"
alias mv="mv -i"

# terminal colors.
eval "`dircolors ~/.dircolors`"

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Set PS1.
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
PS1='\n${debian_chroot:+($debian_chroot)}'
PS1=$PS1'\[\033[01;32m\]\u@\h\[\033[00m\]:'
PS1=$PS1'\[\033[01;34m\]\W\[\033[00m\]:'
PS1=$PS1'\033[01;33m\]$(parse_git_branch)\[\033[00m\]'
PS1=$PS1'\n\$ '

# tmux with colors.
alias tmux="export TERM=screen-256color && tmux"

# make less more friendly for non-text input files/
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features.
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# --+ Aliases +-----------------------------------------------------------------
# cd (TODO: I feel that this could be easily improved).
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

# show progress on rsync
alias rsync="rsync --info=progress2"

# general utilities
alias c="clear"
alias intar="tar -czf"
alias untar="tar -xzf"
alias fhere="find . -name"
alias hgrep="history | grep"
alias itest="ping google.com -c 1"
alias istest="speedtest"

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
            *.tar.xz)    tar xJf $1     ;;
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

# --+ LOCATIONS +---------------------------------------------------------------
## PATH
export PATH=""
export PATH=$PATH"/bin:/sbin"
export PATH=$PATH":/usr/bin:/usr/sbin"
export PATH=$PATH":/usr/local/bin:/usr/local/sbin"
export PATH=$PATH":~/.local/bin"
export PATH=$PATH":/opt/bin"
