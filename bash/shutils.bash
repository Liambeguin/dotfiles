#!/bin/bash

# shellcheck disable=SC1090
LOGLEVEL=${LOGLEVEL:-2}
HEADER=${HEADER:-""}

die()     {                            echo -e "${HEADER}fatal: $*"; exit 1; }
error()   { [[ ${LOGLEVEL} -ge 1 ]] && echo -e "${HEADER}error: $*"; }
warning() { [[ ${LOGLEVEL} -ge 2 ]] && echo -e "${HEADER}warning: $*"; }
info()    { [[ ${LOGLEVEL} -ge 3 ]] && echo -e "${HEADER}$*"; }
verbose() { [ "$VERBOSE" == "yes" ] && echo -e "${HEADER}$*"; }
# Keeping this for backwards compatibility
exit_err() { die "$@"; }


get_hostname_color() {
	declare mode=${1:-shell}
	declare hostname=${2:-$HOSTNAME}
	declare color="${txtrst}:black"
	declare hash=$(echo " $(hostname | wc -c) % 7" | bc)

	case "$hostname" in
		*atris*) color="${txtblu}:blue"    ;;
		*mara*)  color="${txtpur}:magenta" ;;
		# Add other supported hostnames here
		*)
		case "${hash}" in
			0)color="${txtred}:red"     ;;
			1)color="${txtgrn}:green"   ;;
			2)color="${txtylw}:yellow"  ;;
			3)color="${txtblu}:blue"    ;;
			4)color="${txtpur}:magenta" ;;
			5)color="${txtcyn}:cyan"    ;;
			6)color="${txtwht}:white"   ;;
			*)color="${txtrst}:black"   ;;
		esac
		;;
	esac

	case "$mode" in
		shell) printf "%s" "${color%%:*}" ;;
		tmux)  printf "%s" "${color##*:}" ;;
	esac
}
pprint_hostname() {
	declare h="${1:-$HOSTNAME}"
	printf "%b%s%b\n" "$(get_hostname_color shell "$h")" "$h" "$txtrst"
}

ask_yesno() {
	# brief
	#    return 0 if yes else 1
	#
	# usage
	#    ask_yesno "all good ?" && echo perfect || echo what now !

    local question="$1"

	read -p "$question [y/N] " rc
	if [ "$rc" = "y" ]; then
		return 0
	else
		return 1
	fi
}
ask_input() {
    local question="$1"
	local default="$2"

	if [ -n "$default" ]; then
		read -p "$question [$default] " rc
		[ -z "$rc" ] && rc="$default"
	else
		read -p "$question " rc
		[ -z "$rc" ] && exit 1
	fi

	printf "%s" "$rc"
}

get_minor() {
	local filepath=
	local rev=

	filepath=$(realpath "$1")

	rev=$(git -C "$(dirname "$filepath")" rev-list --all --count -- "$(basename "$filepath")" 2>/dev/null) || rev=X
	printf "%s" $rev
}

export -f get_minor
export -f get_hostname_color
export -f pprint_hostname
