#!/bin/bash

BOOKMARKS="${DOTFILES_HOME}/xcd.bookmarks"
[ ! -f "$BOOKMARKS" ] && touch "$BOOKMARKS"

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
	local bookmark_path="$(grep -E "^${bookmark_name}:" "$BOOKMARKS" | cut -d':' -f2)"

	if [ "$bookmark_name" = "-" ]; then
		cd - || return
	elif [ -z "$bookmark_path" ]; then
		echo "ERROR: bookmark not found !"
	else
		cd "$bookmark_path" || return
	fi
}

_xcd_complete() {
	local bookmarks="$(grep -v '^#' "$BOOKMARKS" | cut -d':' -f1)"

	COMPREPLY=()
	if [ "$COMP_CWORD" = 1 ]; then
		COMPREPLY=( $(compgen -W "$bookmarks" -- "$2") )
	fi
}
complete -F _xcd_complete xcd

xcd() {
	case "$1" in
		-a|--add)  _xcd_add "$2" "$3";;
		-r|--rm)   _xcd_rm  "$2" ;;
		-e|--edit) $EDITOR  "$BOOKMARKS" ;;
		-l|--list) column -t -s: "$BOOKMARKS"; echo ;;
		-h|--help|help|-+([-a-zA-Z0-9]))
			echo "USAGE:"
			echo "    xcd -h | --help | help .......... Display this message"
			echo "    xcd -a | --add bookmark path .... Add path as a bookmark"
			echo "    xcd -r | --rm  bookmark ......... Remove bookmark"
			echo "    xcd -e | --edit ................. Edit bookmarks"
			echo "    xcd bookmark .................... Goto to bookmark (cd)"
			echo
			echo "NOTE:"
			echo "    Using xcd with no bookmark will goto default (xcd default)"
			echo
			;;
		*)  _xcd_run "$1" ;;
	esac
}
