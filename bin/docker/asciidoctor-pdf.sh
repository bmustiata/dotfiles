#!/bin/bash

PROJECT_FOLDER=$(pwd)

docker run --rm \
    -v $PROJECT_FOLDER:/documents \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    asciidoctor/docker-asciidoctor:pdf-015 \
    /usr/bin/sudo -E -u "#$(id -u)" "/usr/local/bin/asciidoctor-pdf" "-r" "asciidoctor-diagram" "$@"

