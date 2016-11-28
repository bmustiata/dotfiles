#!/usr/bin/env bash

#
# Ressurect a dead container, and run whatever command you want on it
# assumably /bin/bash
#

DEAD_CONTAINER_ID=$1
COMMAND=$2

if [[ "$DEAD_CONTAINER_ID" == "" ]]; then
    echo "You need to specify a container ID"
fi # [[ "$DEAD_CONTAINER_ID" == "" ]]

if [[ "$COMMAND" == "" ]]; then
    COMMAND="/bin/bash"
fi # [[ "$COMMAND" == "" ]]

IMAGE_FROM_DEAD_CONTAINER_ID=$(docker commit $DEAD_CONTAINER_ID)

docker run --rm --volumes-from=$DEAD_CONTAINER_ID --entrypoint="$COMMAND" -it $IMAGE_FROM_DEAD_CONTAINER_ID

docker rmi $IMAGE_FROM_DEAD_CONTAINER_ID

