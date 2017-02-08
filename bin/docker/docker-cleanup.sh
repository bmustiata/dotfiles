#!/usr/bin/env bash

if [[ "$1" == "-a" ]]; then
    echo "Removing exited docker containers, since the script was called with -a."
    docker ps --filter "status=exited" -q | xargs docker rm -v
else # not [[ "$1" == "-a" ]]
    echo "To remove also shut down containers, use '-a'"
fi   # else [[ "$1" == "-a" ]]

docker images --filter "dangling=true" -q | xargs docker rmi

