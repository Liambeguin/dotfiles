# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc

# --------------------------
# SOURCEING FILES IN ~/.bash
# --------------------------
# Source personnal bash utilities
# XXX We could also just source everything in ~/.bash
[ -f ~/.bash/shutils.conf ] && source ~/.bash/shutils.conf
[ -f ~/.bash/colorutils.conf ] && source ~/.bash/colorutils.conf
# the following file includes machine specifics
# or private variables/functions, ...
[ -f ~/.bash/local.conf ] && source ~/.bash/local.conf
# set PS1 depending on hostname
# Default PS1 is : '[\u@\h \W]\$ '
[ -f ~/.bash/ps1.conf ] && source ~/.bash/ps1.conf
[ -f ~/.bash/aliases.conf ] && source ~/.bash/aliases.conf
[ -f ~/.bash/screen.conf ] && source ~/.bash/screen.conf
#source pager.conf should be done by dotfiles/install


# remapping CAPS LOCK to CTRL
setxkbmap -option ctrl:nocaps

# Make sure we are using the correct TERM (vim-airline)
TERM=xterm-256color

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

HISTCONTROL=ignoreboth

PATH="$PATH:/opt/gcc-arm-none-eabi-4_9-2014q4/bin"
PATH="$PATH:/home/lvb/bin"

