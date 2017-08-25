#!/usr/bin/env bash

VIDEO_FILE="$(readlink -f $1)"
OUTPUT_FILE="$(readlink -f $2)"

docker run \
    --rm \
    -v $VIDEO_FILE:/tmp/in/test.avi \
    -v $(dirname $OUTPUT_FILE):/tmp/write \
    -e OUTPUT_FILE_NAME=$(basename $OUTPUT_FILE) \
    bmst/gif-create

