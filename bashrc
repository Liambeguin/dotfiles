#!/bin/bash
# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

export EDITOR=/usr/bin/vim

export DOTFILES_HOME="${HOME}/dev/dotfiles"
# Make sure we are using the correct TERM (vim-airline)
export TERM=xterm-256color
export PATH="${DOTFILES_HOME}/bin:$PATH"
export PATH="${HOME}/bin:$PATH"

[ -z "$PS1" ] && return

# Force ignoreups and ignorespace
HISTCONTROL=ignoreboth
# ignore common cmds
HISTIGNORE="ls:bg:fg:tm :re :"
# append to history file, no overwrite
shopt -s histappend


# be awesome !!
set -o vi

tput smkx                      # st: fix Del key issue
[ -n "$PS1" ] && stty -ixon    # Fix vim blocked when typing <ctrl>-S
unset command_not_found_handle # prevent dnf from prompting for install


# Source personnal bash utilities
source_files="aliases.bash colorutils.bash pager.bash ps1.bash shutils.bash xcd.bash"
for f in $source_files; do
	test -f "${DOTFILES_HOME}/bash/$f" && source "${DOTFILES_HOME}/bash/$f"
done

for local_file in ~/.bash/local/* ; do
	test -f "$local_file" && source "$local_file"
done

git_completion="${HOME}/dev/git/contrib/completion/git-completion.bash"
test -f "${git_completion}" && source "${git_completion}"

for file in ~/.bash_completion.d/* ; do
	test -f "${file}" && source "${file}"
done

set_prompt
