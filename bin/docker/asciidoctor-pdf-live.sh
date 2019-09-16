#!/bin/bash

PROJECT_FOLDER=$(pwd)

flr -o \
    "$1" \
    -e "
docker run --rm \
    -v $PROJECT_FOLDER:/documents \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -w /documents \
    -u $(id -u):$(id -g) \
    bmst/docker-asciidoctor \
    '/usr/bin/asciidoctor-pdf' '-r' 'asciidoctor-diagram' '$@'
"

