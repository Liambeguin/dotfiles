# .bashrc
red="\e[31m"
normal="\e[0m"
bold="\e[1;37m"

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTCONTROL=ignoreboth

# User specific aliases and functions
alias ls='ls --color=auto -p'
alias grep='grep --color=auto'

function __pcom {
        if [ ! -z "$1" ]; then
                picocom -b 115200 -l /dev/ttyUSB${1}
        fi
}
alias pcom=__pcom

function __xcom {
        if [ ! -z "$1" ]; then
                picocom -b 115200 -l /dev/serial/by-id/usb-Xiphos_Systems_Corp._Q7-PIM_${1}-*
        else
                echo "no serial..." 
        fi
}
alias xcom=__xcom

alias lq7="ls -l /dev/serial/by-id/usb-Xiphos_Systems_Corp._Q7-PIM_* \
| awk '{print $9}' \
| sed 's/.*usb-\(.*\)-if00.*/\1/'\
| sed 's/_/ /g'"


##################################
# adding Dynamic names to screen #
##################################

settitle() {
    printf "\033k$1\033\\"
}
resettitle(){
        printf "\033k${USER}@${HOSTNAME}:${PWD}\033\\"
}
__screen_ssh() {
        settitle "ssh  : $*"
        ssh "$@"
        resettitle
}
__screen_xcom() {
        settitle "xcom : $*"
        xcom "$@"
        resettitle
}

__screen_vim() {
        settitle "vim  : ${PWD}"
        vim "$@"
        resettitle
}

case $TERM in
  screen*)
        alias xcom=__screen_xcom "$@"
        alias ssh=__screen_ssh "$@"
        alias vim=__screen_vim "$@"
        ;;
esac
