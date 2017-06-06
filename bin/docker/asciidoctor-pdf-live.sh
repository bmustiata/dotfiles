#!/bin/bash

PROJECT_FOLDER=$(pwd)

flr -o \
    "$1" \
    -e "
docker run --rm \
    -v $PROJECT_FOLDER:/documents \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    asciidoctor/docker-asciidoctor \
    /usr/bin/sudo -E -u '#$(id -u)' '/usr/local/bin/asciidoctor-pdf' '-r' 'asciidoctor-diagram' '$@'
"

