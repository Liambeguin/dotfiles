#!/bin/bash
# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

export DOTFILES_HOME="${HOME}/dev/dotfiles"
# Make sure we are using the correct TERM (vim-airline)
export TERM=xterm-256color
export PATH="$PATH:/opt/gcc-arm-none-eabi-4_9-2014q4/bin"
export PATH="$PATH:/home/lvb/bin"

# Force ignoreups and ignorespace
HISTCONTROL=ignoreboth
# ignore common cmds
HISTIGNORE="ls:bg:fg:tm :re :"
# append to history file, no overwrite
shopt -s histappend


# be awesome !!
set -o vi

tput smkx                   # st: fix Del key issue
[ -n "$PS1" ] && stty -ixon # Fix vim blocked when typing <ctrl>-S


# Source personnal bash utilities
source_files="aliases.bash colorutils.bash pager.bash ps1.bash shutils.bash xcd.bash"
for f in $source_files; do
	test -f "${DOTFILES_HOME}/bash/$f" && source "${DOTFILES_HOME}/bash/$f"
done

for local_file in ~/.bash/local/* ; do
	test -f "$local_file" && source "$local_file"
done

set_prompt
