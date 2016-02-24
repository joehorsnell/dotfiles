#!/bin/zsh
# Script to make a Vostron call request via HTTP.
# Note: This script uses httpie (http://httpie.org) as it has a simple syntax for headers
# and cookies, although it should be trivial to adapt it to use curl or similar.

# Show usage if no arguments are provided
if [[ $# -eq 0 ]] ; then
    echo 'Usage: '$(basename $0)' number_to_call_when_answered [number_to_call_first]'
    echo 'NOTE: Requires that httpie is installed (http://httpie.org)'
    echo 'Environment variables:'
    echo '  VOSTRON_DEFAULT_NUMBER - The default number to call first (optional)'
    echo '  VOSTRON_SIP_USERNAME   - Your SIP user name'
    echo '  VOSTRON_USERNAME       - Your web user name'
    echo '  VOSTRON_PASSWORD       - Your web password'
    exit 0
fi

# Change this to use a different command to make the call, such as curl
# http_command='http'
http_command='curl'

# Check that required command is installed
command -v $http_command >/dev/null 2>&1 || { echo >&2 "Please install $http_command."; exit 1 }

# If no second argument is provided, then we required the number to call first to be
# supplied via an environment variable.
if [[ $# -eq 1 ]] ; then
	: ${VOSTRON_DEFAULT_NUMBER:?"You must set the VOSTRON_DEFAULT_NUMBER environment variable if you do not provide the first number to call, using the second argument"}
fi

: ${VOSTRON_SIP_USERNAME:?"You must supply the VOSTRON_SIP_USERNAME environment variable"}
: ${VOSTRON_USERNAME:?"You must supply the VOSTRON_USERNAME environment variable"}
: ${VOSTRON_PASSWORD:?"You must supply the VOSTRON_PASSWORD environment variable"}

number_to_call_when_answered=$1
number_to_call_first=${2-$VOSTRON_DEFAULT_NUMBER}
# This is the format for httpie: cookie='Cookie:_username='$VOSTRON_USERNAME'; _password='$VOSTRON_PASSWORD' ; _pages=reset'
cookie='_username='$VOSTRON_USERNAME'; _password='$VOSTRON_PASSWORD' ; _pages=reset'

echo "Calling" $number_to_call_first "first, then calling"  $number_to_call_when_answered "when answered"

# Command when using httpie: $http_command https://sip.vostron.net/actions/call/save/\?stype\=\&phone\=$VOSTRON_SIP_USERNAME\&snumber\=$number_to_call_first\&cnumber\=$number_to_call_when_answered\&callerid1\=\&callerid2\=\&answer1\=0\&submit\=Call $cookie > /dev/null
$http_command https://sip.vostron.net/actions/call/save/\?stype\=\&phone\=$VOSTRON_SIP_USERNAME\&snumber\=$number_to_call_first\&cnumber\=$number_to_call_when_answered\&callerid1\=\&callerid2\=\&answer1\=0\&submit\=Call --silent --cookie $cookie > /dev/null
