#!/bin/bash

PROGVERSION="2.0"

BOOKMARKS_G="${DOTFILES_HOME}/xcd.bookmarks"
[ ! -f "$BOOKMARKS_G" ] && touch "$BOOKMARKS_G"
BOOKMARKS_L="${DOTFILES_HOME}/xcd.bookmarks.local"
[ ! -f "$BOOKMARKS_L" ] && printf "\n" >"$BOOKMARKS_L"
BOOKMARKS="${BOOKMARKS_L}"

_xcd_add() {
	local bookmark_name="$1"
	local bookmark_path="$2"

	if [ -z "$bookmark_name" ]; then
		echo "ERROR: No name given..."
	elif grep -Eq "^$bookmark_name:" "$BOOKMARKS"; then
		echo "ERROR: Bookmark already registered !"
	elif [ -z "$bookmark_path" ]; then
		echo "No path given, assuming $PWD"
		echo "${bookmark_name}:${PWD}" >>"$BOOKMARKS"
		echo "Added $bookmark_name !"
	else
		echo "${bookmark_name}:${bookmark_path}" >>"$BOOKMARKS"
		echo "Added $bookmark_name !"
	fi
}

_xcd_rm() {
	local bookmark_name="$1"

	sed -i "/^$bookmark_name:/d" "$BOOKMARKS"
}

_xcd_run() {
	local bookmark_name="${1:-default}"
	local bookmark_path="$(awk -F: -v bookmark="$bookmark_name" \
			'$0 ~ "^" bookmark ":" {print $2}' \
			"${BOOKMARKS_G}" "${BOOKMARKS_L}")"

	if [ "$bookmark_name" = "-" ]; then
		cd - || return
	elif [ -z "$bookmark_path" ]; then
		echo "ERROR: bookmark not found !"
	else
		cd "$bookmark_path" || return
	fi
}

_xcd_complete() {
	local bookmarks="$(awk -F: '$0 ~ "^[a-zA-Z0-9]" {print $1}' \
			"${BOOKMARKS_G}" "${BOOKMARKS_L}")"

	COMPREPLY=()
	if [ "$COMP_CWORD" = 1 ]; then
		COMPREPLY=( $(compgen -W "$bookmarks" -- "$2") )
	fi
}
complete -F _xcd_complete xcd

_xcd_usage() {
	echo "usage: xcd [bookmark]"
	echo "   or: xcd <-h | --help>"
	echo "   or: xcd [--local | --global] [a]dd <bookmark> [path]"
	echo "   or: xcd [--local | --global] [r]m <bookmark>"
	echo "   or: xcd [--local | --global] [e]dit"
	echo "   or: xcd [l]ist"
	echo ""
	echo "Available options:"
	echo "    -h | --help  ............. Display this message"
	echo "    -l | --local ............. Update local bookmarks (default)"
	echo "    -g | --global ............ Update global bookmarks"
	echo ""
	echo "Notes:"
	echo "    - Using xcd with no bookmark will goto default (xcd default)"
	echo "    - xcd defaults to --local if no option is passed"
	echo ""
}

xcd() {
	local SHORTOPTS="lghV"
	local LONGOPTS="local,global,help,version"
	local ARGS=
	local CMD=

	ARGS=$(getopt -s bash --options $SHORTOPTS  \
		--longoptions $LONGOPTS --name "xcd" -- "$@")

	eval set -- "$ARGS"
	while true; do
		case "$1" in
		-v|--version) echo "$PROGVERSION"; return 0;;
		-l|--local) BOOKMARKS="${BOOKMARKS_L}";;
		-g|--global) BOOKMARKS="${BOOKMARKS_G}";;
		-h|--help) _xcd_usage;;
		--) shift; break;;
		*) _xcd_usage ; return 1;;
		esac
		shift
	done

	CMD="${CMD:-$1}"; shift

	case "$CMD" in
	a|add) _xcd_add "$1" "$2";;
	r|rm) _xcd_rm  "$1";;
	e|edit) $EDITOR  "$BOOKMARKS";;
	l|list) column -t -s: "$BOOKMARKS_G" "$BOOKMARKS_L"; echo;;
	h|help) _xcd_usage; return 0;;
	v|version) echo "$PROGVERSION"; return 0;;
	*) _xcd_run "$CMD";;
	esac
}
