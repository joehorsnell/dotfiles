#!/bin/zsh
# Script to make a call using Vostron via HTTP

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
cookie='Cookie:_username='$VOSTRON_USERNAME'; _password='$VOSTRON_PASSWORD' ; _pages=reset'

echo "Calling" $number_to_call_first "first, then calling"  $number_to_call_when_answered "when answered"

http https://sip.vostron.net/actions/call/save/\?stype\=\&phone\=$VOSTRON_SIP_USERNAME\&snumber\=$number_to_call_first\&cnumber\=$number_to_call_when_answered\&callerid1\=\&callerid2\=\&answer1\=0\&submit\=Call $cookie
