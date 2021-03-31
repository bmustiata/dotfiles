if [[ "$2" == "" ]]; then
    print "usage: getcert.sh hostname:port outfile.crt"
    exit 1
fi # [[ "$2" == "" ]]

openssl s_client -showcerts -connect $1 </dev/null 2>/dev/null|openssl x509 -outform PEM > $2
