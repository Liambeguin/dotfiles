#!/bin/bash

# shellcheck disable=SC1090
LOGLEVEL=${LOGLEVEL:-2}
HEADER=${HEADER:-""}

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
export -f get_hostname_color
