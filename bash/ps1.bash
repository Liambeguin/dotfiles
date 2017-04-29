#!/bin/bash
# set PS1 depending on hostname
# Default PS1 is : '[\u@\h \W]\$ '
#
# If PS1 needs to be reloaded with each new command use this:
# PROMPT_COMMAND='set_prompt'

set_prompt () {
	local base_color="${PS1_COLOR_BASE:-"$txtrst"}"
	local path_color="${PS1_COLOR_PATH:-"$txtrst"}"
	local host_color="${PS1_COLOR_HOST:-$(get_hostname_color shell)}"
	local user_color="${PS1_COLOR_USER:-"$txtrst"}"

	PROMPT_DIRTRIM=4
	# PS1="\[$base_color\]\\m "
	PS1="\[$base_color\]"
	PS1="${PS1}\[$host_color\]\\h:"
	PS1="${PS1}\[$path_color\]\\w "
	PS1="${PS1}\[${bldwht}\]>>>\[$txtrst\] "
}
