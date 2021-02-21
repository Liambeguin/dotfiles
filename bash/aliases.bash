#!/bin/bash

vipe() {
	local TMPFILE=$(mktemp /tmp/vipe.bashXXXXXXXX)

	cat > ${TMPFILE}
	vim "$@" ${TMPFILE} < /dev/tty > /dev/tty
	cat ${TMPFILE}

	rm ${TMPFILE}
}

dts-helper() {
	local action=$1
	local infile=$2

	local outfile=$(basename $infile).out
	local vi_opts="-c 'set ft=dts' -c 'abbrev q qa!'"

	if [ $(echo $infile | grep -i xdi) ]; then
		cmd="tar Oxf $infile devicetree.img | dd "
	else
		cmd="dd if=$infile "
	fi

	case $action in
		view)
			$cmd bs=1 skip=$((0x40)) \
				| dtc -I dtb -O dts \
				| vi "${vi_opts}" -
			;;
		edit)
			local tmpdtb=$(mktemp /tmp/dtbXXXXXXXX)
			$cmd bs=1 skip=$((0x40)) \
				| dtc -I dtb -O dts \
				| vipe "${vi_opts}" \
				| dtc -I dts -o $tmpdtb

			mkimage -A arm -O linux -T firmware -C none -n DTB -d $tmpdtb -e 0 -a 0 $outfile
			echo changes saved to $outfile
			rm $tmpdtb
			;;
		*)
			echo unknown action: $action
			;;
	esac
}

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
	local version=${1:-2018.2}
	test -z "$version" && return
	source /opt/Xilinx/Vivado/$version/settings64.sh
	_prefix add "${txtred}" "($version)"
}
test -d /opt/Xilinx/Vivado/ && complete -W "$(ls -1 /opt/Xilinx/Vivado/)" xsource

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

_prefix() {
	local action=${1}
	local color=${2}
	local txt=${3}
	local prefix="\[${color}\]${txt}\[${txtrst}\] "
	local _escaped

	if [ "${action}" == "add" ]; then
		export PS1="${prefix}${PS1}"
	elif [ "${action}" == "rm" ]; then
		_escaped=$(echo "${prefix}" | sed -e 's/[]\/$*.^[]/\\&/g')
		export PS1=$(echo "$PS1" | sed -e "s/$_escaped//g")
	else
		echo ERROR: unknown action \'$action\'
	fi
}

cross() {
	case $1 in
	zynq|q7|arm)
		if [ -n "$_PS1_CROSS_PREFIX" ]; then
			echo "ERROR: other cross env already setup deactivate before switching"
			return
		fi
		export CROSS_COMPILE=arm-linux-gnu-
		# export CROSS_COMPILE=arm-linux-gnueabihf-
		export ARCH=arm
		export LOADADDR=0x8000
		_PS1_CROSS_PREFIX="(ZYNQ)"
		_prefix add "${bldred}" "${_PS1_CROSS_PREFIX}"
		;;
	zynqmp|q8|arm64|aarch64)
		if [ -n "$_PS1_CROSS_PREFIX" ]; then
			echo "ERROR: other cross env already setup deactivate before switching"
			return
		fi
		export CROSS_COMPILE=aarch64-linux-gnu-
		export ARCH=arm64
		_PS1_CROSS_PREFIX="(ZYNQMP)"
		_prefix add "${bldred}" "${_PS1_CROSS_PREFIX}"
		;;
	deactivate)
		unset CROSS_COMPILE
		unset ARCH
		_prefix rm "${bldred}" "${_PS1_CROSS_PREFIX}"
		unset _PS1_CROSS_PREFIX
		;;
	esac
}
complete -W "zynq zynqmp q7 q8 deactivate" cross


# IP stuff
alias ifconfig="echo \$\* >/dev/null; cheat ip;echo LEARN TO USE IP !!!"
alias ipa="ip -br -c address | column -t"
alias ipl="ip -br -c link    | column -t"
