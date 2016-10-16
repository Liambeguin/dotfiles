#!/bin/sh

[ -f ~/.tmux/functions.conf ] && . ~/.tmux/functions.conf

# Available attribute options:
#
# [bright] black
# [bright] red
# [bright] green
# [bright] yellow
# [bright] blue
# [bright] magenta
# [bright] cyan
# [bright] white
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
	echo " #[fg=white,bold,bg=red]ERROR#[default] "
	exit 1
fi

# Set attributes for given fields
test_attr="fg=red,bg=green,bold"
uptime_attr="fg=black,bg=white"
load_avg_attr="fg=black,bg=yellow"
ram_attr="fg=white,bg=green"
ip_attr="fg=black,bold,bg=white"
vpn_attr="fg=white,bold,bg=blue"
wifi_attr="fg=white,bold,bg=blue"

# NOTE: set this to track a different network interface
export TMUX_MONITORING_INTERFACE=""
export TMUX_DATE_FORMAT="(%A) [%Y-%b-%d] %H:%M"

left_status="logo battery whoami session"
right_status="uptime load_avg disk ram vpn ip wifi date"

out="#[default]"
for i in $(eval echo "\$${side}_status"); do
	if [ -n "$(__${i} | sed 's/\s//g')" ]; then
		out="$(printf "%s" "$out" ; eval echo -n "\#[\$${i}_attr]"; __${i})#[default] "
	fi
done
echo "$out"

exit 0
