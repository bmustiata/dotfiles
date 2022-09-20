if [[ "$1" == "--full" ]]; then
    openssl x509 -in $2 -text -noout
    exit 0
fi # [[ "$0" == "--full" ]]

openssl x509 -in $1 -text -noout | grep 'Subject:' | tr -s " "
