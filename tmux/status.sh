#!/bin/sh

[ -f ~/.tmux/functions.conf ] && . ~/.tmux/functions.conf

# Available attribute options:
#
# black
# red
# green
# yellow
# blue
# magenta
# cyan
# white
# black
# brightblack
# brightred
# brightgreen
# brightyellow
# brightblue
# brightmagenta
# brightcyan
# brightwhite
#
# dim
# underscore
# bold
# reverse
# standout
# blinking
# hidden
# italics


side="$1"
if [ "$side" != "left" ] && [ "$side" != "right" ]; then
	echo error
	exit 1
fi

test_attr="fg=red,bg=green,bold"
uptime_attr="fg=black,bg=white"
load_avg_attr="fg=black,bg=yellow"
ram_attr="fg=white,bg=green"
ip_attr="fg=black,bold,bg=white"

left_status="logo release whoami session"
right_status="uptime load_avg ram ip" #plus date

out="#[default]"
for i in $(eval echo "\$${side}_status"); do
	#TODO if -z attr no space
	out="$(printf "%s " "$out" ; eval echo -n "\#[\$${i}_attr]"; __${i})#[default]"
done
echo "$out "

exit 0
