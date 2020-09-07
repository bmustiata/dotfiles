#!/usr/bin/env bash

set -e

# echo | openssl s_client -showcerts -servername gnupg.org -connect gnupg.org:443 2>/dev/null | openssl x509 -inform pem -noout -text

if [[ "$1" == "" ]]; then
    echo "You need to pass the site name to dump the certificate from:"
    echo "ie: $0 germaniumhq.com"
    exit 1
fi # [[ "$1" == "" ]]

mkdir -p /usr/share/ca-certificates/extra
echo | openssl s_client -showcerts -servername $1 -connect $1:443 > /usr/share/ca-certificates/extra/$1.crt
ln -s /usr/share/ca-certificates/extra/$1.crt /etc/ssl/certs/$1.crt
sudo update-ca-certificates

