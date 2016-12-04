#!/usr/bin/env bash

if [[ "$1" == "-a" ]]; then
    docker rm -v $(docker ps -a | grep Exited | tr -s " " | cut -f1 -d\ )
else # not [[ "$1" == "-a" ]]
    echo "To remove also shut down containers, use '-a'"
fi   # else [[ "$1" == "-a" ]]

docker rmi $(docker images | grep '<none>' | tr -s " " | cut -f3 -d\ )

