#!/bin/bash

PROJECT_FOLDER=$(pwd)

docker run --rm \
    -v $PROJECT_FOLDER:/documents \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -u $(id -u):$(id -g) \
    bmst/docker-asciidoctor \
    "/usr/bin/asciidoctor" "$@"

