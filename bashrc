# .bashrc
red="\e[31m"
normal="\e[0m"
bold="\e[1;37m"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source personnal bash files
[ -f ~/bin/bash_functions.conf ] && source ~/bin/bash_functions.conf
[ -f ~/bin/bash_colors.conf ] && source ~/bin/bash_colors.conf


# the following file includes machine specifics
# or private variables/functions, ...
if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi

# remapping CAPS LOCK to CTRL
setxkbmap -option ctrl:nocaps

# Make sure we are using the correct TERM (vim-airline)
TERM=xterm-256color

# VIMPAGER
export PAGER=/usr/local/bin/vimpager
alias less=$PAGER
alias zless=$PAGER
alias vimcat="vimcat -c 'set bg=light'"
# CHEAT
export EDITOR=/usr/bin/vim
function __cheat() {
	if [ $# == 1 ]; then
		cheat $1 | vimcat -c 'set ft=sh'
	else
		cheat $@
	fi
}
alias cheat=__cheat

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTCONTROL=ignoreboth

# User specific aliases and functions
alias ls='ls --color=always -p'
alias ll='ls -la --color=always -p'
alias dmesg='dmesg --color=always -T'
alias grep='grep --color=auto'
alias du='du -h -d 1'

# screen related aliases
alias scw='screen -X windowlist'
alias scn='screen -X next'

function __screen_quit () {

	if [ -z "$(echo $TERM | grep screen)" ]; then
		echo "This is not a screen session !"
		return
	fi

	read -p "Sure you want to quit this screen session [y/n] ? " -t 5 quit
	if [ -z "$quit" ]; then
		__screen_quit
	elif [ "$quit" == "y" ]; then
		screen -X quit
	else
		echo too bad..
	fi
}
alias scq=__screen_quit


# picocom related aliases
function __pcom {
	if [ ! -z "$1" ]; then
		picocom -b 115200 -l ${1}
	fi
}
alias pcom=__pcom

##################################
# adding Dynamic names to screen #
##################################
# Works also w/ byobu !

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
__screen_pcom() {
	settitle "pcom : $*"
	pcom "$@"
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
	alias pcom=__screen_pcom "$@"
	alias ssh=__screen_ssh "$@"
	alias vim=__screen_vim "$@"
	alias man=__screen_man "$@"
	;;
esac


PATH="$PATH:/opt/gcc-arm-none-eabi-4_9-2014q4/bin"
PATH="$PATH:/home/lvb/bin"
