#!/usr/bin/env bash

CURRENT_DIR=`pwd`

ALL_PARAMETERS="$@"

docker run -it \
    --rm \
    -v $CURRENT_DIR:$CURRENT_DIR \
    -u $(id -u):$(id -g) \
    thrift:0.12 bash -c "cd $CURRENT_DIR; thrift $ALL_PARAMETERS"


