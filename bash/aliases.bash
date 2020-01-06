#!/bin/bash

taredit() {
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

xsource() {
	local version=$1
	source /opt/Xilinx/SDK/$version/settings64.sh
}
complete -W $(ls /opt/Xilinx/SDK/) xsource

# Misc
alias re='exec bash'
alias ls='ls --color=always -p'
alias ll='ls -la --color=always -p'
alias dmesg='dmesg --color=always -T'
alias grep='grep --color=auto'
alias du='du -h -d 1'
alias listcmds="compgen -c"
alias weather='curl http://wttr.in/montreal'
alias hist="history | grep -i $1"
alias tmux="tmux -2"
alias tm="tmux attach || tmux new"
alias pg="pgrep -la"
alias tfs="wmctrl -r :ACTIVE: -b toggle,fullscreen"
alias path="echo \"$PATH\" | tr ':' '\n'"

config() {
	_vim() {
		vim -c 'abbr q qa' -p $*
	}

	case $1 in
		todo)    _vim ~/TODOs ;;
		vi|vim)  _vim ~/.vimrc ~/.vim/plugin/ ;;
		bash)    _vim ~/.bashrc ${DOTFILES_HOME}/bash/aliases.bash ;;
		ssh)     _vim ~/.ssh/config ~/.ssh/known_hosts ;;
		git|tig) _vim ~/.gitconfig ~/.tigrc ;;
		*)      echo "ERROR: unknown configuration" ;;
	esac
}
complete -W "todo vi vim bash ssh git tig" config


# IP stuff
alias ifconfig="echo \$\* >/dev/null; cheat ip;echo LEARN TO USE IP !!!"
alias ipa="ip -br -c address | column -t"
alias ipl="ip -br -c link    | column -t"
