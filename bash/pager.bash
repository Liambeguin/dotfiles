#!/bin/bash

alias vimcat="vimcat -c 'set bg=light'"

export EDITOR=/usr/bin/vim

alias less="less -R"

export MANPAGER=vimpager

if [ "$MANPAGER" == "less" ]; then
    # Without this no colors...
    export GROFF_NO_SGR=1

    # tput colors:
    # 0 Black
    # 1 Red
    # 2 Green
    # 3 Yellow
    # 4 Blue
    # 5 Magenta
    # 6 Cyan
    # 7 White
    export LESS_TERMCAP_mb=$(tput setaf 2)
    export LESS_TERMCAP_md=$(tput setaf 4)
    export LESS_TERMCAP_me=$(tput sgr0)
    export LESS_TERMCAP_so=$(tput setab 4; tput bold; tput setaf 7)
    export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
    export LESS_TERMCAP_us=$(tput bold; tput smul; tput setaf 0)
    export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
    export LESS_TERMCAP_mr=$(tput rev)
    export LESS_TERMCAP_mh=$(tput dim)
    export LESS_TERMCAP_ZN=$(tput ssubm)
    export LESS_TERMCAP_ZV=$(tput rsubm)
    export LESS_TERMCAP_ZO=$(tput ssupm)
    export LESS_TERMCAP_ZW=$(tput rsupm)
fi
