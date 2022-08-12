#!/usr/bin/env bash

set -e

# echo | openssl s_client -showcerts -servername gnupg.org -connect gnupg.org:443 2>/dev/null | openssl x509 -inform pem -noout -text

if [[ "$1" == "" ]]; then
    echo "You need to pass the site name to dump the certificate from:"
    echo "ie: $0 germaniumhq.com or $0 germaniumhq.com 8443"
    exit 1
fi # [[ "$1" == "" ]]


if [[ "$2" == "" ]]; then
    echo | openssl s_client -showcerts -servername $1 -connect $1:443
else # not [[ "$2" == "" ]]
    echo | openssl s_client -showcerts -servername $1 -connect $1:$2
fi   # else [[ "$2" == "" ]]

