# .bashrc
red="\[31m"
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
alias ls='ls --color=always -p'
alias dmesg='dmesg --color=always -T'
alias grep='grep --color=auto'

function __pcom {
	if [ ! -z "$1" ]; then
		picocom -b 115200 -l /dev/ttyUSB${1}
	fi
}
alias pcom=__pcom

function __dcom {
	if [ -z "$1" ]; then
		picocom -b 115200 -l --imap=lfcrlf /dev/serial/by-id/usb-Dronolab_Boreas_1_FTXUTWW3-if01-port0
	else
		picocom -b 115200 -l --imap=lfcrlf /dev/ttyUSB${$1}
	fi
}

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
__screen_dcom() {
	settitle "dcom : $*"
	dcom "$@"
	resettitle
}

__screen_vim() {
	settitle "vim  : ${PWD}"
	vim "$@"
	resettitle
}

__screen_man() {
	settitle "man  : $*"
	man "$@"
	resettitle
}

case $TERM in
  screen*)
	alias dcom=__screen_dcom "$@"
	alias ssh=__screen_ssh "$@"
	alias vim=__screen_vim "$@"
	alias man=__screen_man "$@"
	;;
esac


PATH="$PATH:/opt/gcc-arm-none-eabi-4_9-2014q4/bin"
PATH="$PATH:/home/lvb/bin"
