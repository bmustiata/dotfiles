#!/bin/bash

PROJECT_FOLDER=$(pwd)

if [[ -z "$ASCIIDOCTOR_SITE_FOLDER" ]]; then
    ASCIIDOCTOR_SITE_FOLDER="/documents"
fi # [[ -z "$ASCIIDOCTOR_SITE_FOLDER" ]]

docker run --rm \
    -v $PROJECT_FOLDER:$ASCIIDOCTOR_SITE_FOLDER \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -w "$ASCIIDOCTOR_SITE_FOLDER" \
    -u $(id -u):$(id -g) \
    bmst/docker-asciidoctor \
    "/usr/bin/asciidoctor" "-r" "asciidoctor-diagram" "$@"

