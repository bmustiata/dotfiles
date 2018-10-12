#!/usr/bin/env bash

if [[ "$3" == "" ]]; then
    SCALING_FACTOR="1.0"
else # not [[ "$3" == "" ]]
    SCALING_FACTOR="$3"
fi   # else [[ "$3" == "" ]]

echo "Scaling factor is: $3"

docker run \
    --rm \
    -v $1:/tmp/in/test.avi \
    -v $(dirname $2):/tmp/write \
    -e OUTPUT_FILE_NAME=$(basename $2) \
    -e SCALING_FACTOR=$SCALING_FACTOR \
    bmst/gif-create
