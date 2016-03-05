#!/bin/bash
_dotutil_autocomplete() {

	local cmd=$1 cur=$2 pre=$3
    local cmds="$(dotutil list | tail -n +2 | cut -d' ' -f1)"

	if [ "$pre" == "$cmd" ]; then
		COMPREPLY=( $(compgen -W "$(dotutil list \
			| tail -n +2 | cut -d' ' -f1)" -- "$cur") )
		return
	fi

	if [ -n "$(echo "$cmds" | grep "$pre")" ]; then
		COMPREPLY=( $(compgen -W "$(dotutil $pre | tail -n +4 | \
			awk '{print $1}')" -- "$cur") )
		return
	fi

}

complete -F _dotutil_autocomplete dotutil
