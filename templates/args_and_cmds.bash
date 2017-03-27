#!/bin/bash -u

[ -f ~/.bash/shutils.conf ] && source ~/.bash/shutils.conf

# globals
declare -g PROGNAME=${0##*/}
declare -g PROGVERSION="0.1.$(get_minor "$0")"

trap cleanup SIGHUP SIGINT SIGTERM EXIT

# Helpers
version() { printf '%s, versions %s\n\n' "$PROGNAME" "$PROGVERSION"; exit 0; }
cleanup() { printf 'cleaning up...\n'; }

set_defaults() {
	VERBOSE="no"
}


# Commands
example_usage() {
	# WARNING: use spaces to indent in usage message
	cat << EOF

USAGE: $PROGNAME [OPTIONS] CMD [ARGS...]

OPTIONS:
    -h | --help ............................ Display this message and exit
    -v | --verbose  ........................ Display more information
    -V | --version ......................... Print version string and exit
    TODO add extra options here

CMD:
    [h]elp ................................. Display this message and exit
    [e]xample .............................. Run example command
    TODO add extra commmands here

EOF
	if [ "$VERBOSE" == "yes" ]; then
		cat << EOF
NOTES:
    - TODO add extra notes here

EOF
	else
		echo "use -v for more info"
	fi
	exit 1
}

example_cmd() {
	declare arg1="${1-""}"
	printf 'running example_cmd with $1=%s and $*=%s\n' "$arg1" "$*"
}

# Start
# Parse options
set_defaults
SHORTOPTS="hvV"
LONGOPTS="help,verbose,version"

ARGS=$(getopt -s bash --options $SHORTOPTS  \
    --longoptions $LONGOPTS --name "$PROGNAME" -- "$@" )

eval set -- "$ARGS"
while true; do
	case $1 in
		-h|--help)    CMD="help" ;;
		-v|--verbose) VERBOSE="yes" ;;
		-V|--version) version ;;
		--) shift; break ;;
		*)  shift; break ;;
	esac
	shift
done


# Parse command and execute
CMD="${CMD:-$1}"
shift; OPTIONS=$*

case "$CMD" in
	e|example) example_cmd ${OPTIONS} ;;
	h|help)    example_usage ;;
	*)         example_usage ;;
esac
