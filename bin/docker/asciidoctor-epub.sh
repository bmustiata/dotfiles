#!/bin/bash

PROJECT_FOLDER=$(pwd)

if [[ -z "$ASCIIDOCTOR_DOCKER_IMAGE" ]]; then
  ASCIIDOCTOR_DOCKER_IMAGE="bmst/docker-asciidoctor"
fi # [[ -z "$ASCIIDOCTOR_DOCKER_IMAGE" ]]

docker run --rm \
    -v $PROJECT_FOLDER:/documents \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -w /documents \
    -u $(id -u):$(id -g) \
    $ASCIIDOCTOR_DOCKER_IMAGE \
    "/usr/bin/asciidoctor-epub3" "--trace" "-r" "asciidoctor-diagram" "$@"

