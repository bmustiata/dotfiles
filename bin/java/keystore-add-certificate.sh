#!/bin/bash

if [[ "$2" == "" ]]; then
    echo "#############################################################################"
    echo "# Import a certificate into a keystore"
    echo "#############################################################################"
    echo "usage: $0 certificate.cer keystore.jks [alias]"
    exit 1
fi # [[ "$2" == "" ]]

if [[ "$3" != "" ]]; then
    ALIAS="$3"
else # not [[ "$3" != "" ]]
    ALIAS="${1%%.*}"  # remove the certificate file extension
fi   # else [[ "$3" != "" ]]

keytool -importcert -file "$1" \
    -keystore "$2" \
    -alias "$ALIAS"

