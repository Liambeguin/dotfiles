#!/bin/bash

_ffind() {
	if [ -d "$1" ]; then
		dir="$1"
		pattern="$2"
		shift 2
		find "$dir" -iname \*"$pattern"\* $*
	else
		pattern="$1"
		shift 1
		find . -iname \*"$pattern"\* $*
	fi
}

_taredit() {
	local tar=$1
	local file=$2

	case $tar in
	''|h|help|-h|--help)
		echo "USAGE: taredit <TARFILE> <FILE>"
		echo "open FILE for TARFILE in vi"
		return ;;
	*) tar xf "${tar}" -O -- "${file}" | vi - -c "abbrev q q!" ;;
	esac
}

_SC() {
	# get description of ShellCheck error code
	[ -z "$1" ] && die "no ShellCheck reference..."
	declare url="https://raw.githubusercontent.com/wiki/koalaman/shellcheck"
	wget -qO- "$url/SC${1}.md" | vi - -Nn -c "
	noremap q :qa!<CR>
	set ts=80
	set tw=80
	set laststatus=0
	set noshowmode
	%norm! gww
	"
}

# Misc
alias re='exec bash'
alias ls='ls --color=always -p'
alias ll='ls -la --color=always -p'
alias dmesg='dmesg --color=always -T'
alias grep='grep --color=auto'
alias du='du -h -d 1'
alias ffind=_ffind
alias listcmds="compgen -c"
alias weather='curl http://wttr.in/montreal'
alias hist="history | grep -i $1"
alias tm="tmux attach || tmux new"
alias pg="pgrep -la"
alias tfs="wmctrl -r :ACTIVE: -b toggle,fullscreen"
alias taredit=_taredit
alias path="echo \"$PATH\" | tr ':' '\n'"

# Code
alias acck="ack --cc"
alias SC=_SC

# Vagrant stuff
alias vup='vagrant up'
alias vssh='vagrant ssh'
alias vdestroy='vagrant destroy'

# VI shortcuts
alias tvi='vi ~/TODOs'
alias bvi='vi -p ~/.bashrc ~/.bash/'
alias vvi='vi -p ~/.vimrc ~/.vim/plugin/'

# IP stuff
alias ifconfig="echo \$\* >/dev/null; cheat ip;echo LEARN TO USE IP !!!"
alias ipa="ip -br address | column -t"
alias ipl="ip -br link    | column -t"
