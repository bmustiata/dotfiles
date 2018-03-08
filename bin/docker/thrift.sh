#!/usr/bin/env bash

CURRENT_DIR=`pwd`

ALL_PARAMETERS="$@"

docker run -it \
    --rm \
    -v $CURRENT_DIR:$CURRENT_DIR \
    -u $(id -u):$(id -g) \
    fbthrift-dev bash -c "cd $CURRENT_DIR; /usr/bin/thrift1 $ALL_PARAMETERS"

