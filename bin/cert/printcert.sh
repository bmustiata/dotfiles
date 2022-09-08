openssl x509 -in $1 -text -noout | grep 'Subject:' | tr -s " "
