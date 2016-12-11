#!/usr/bin/env bash

docker run -d\
    -p 10022:22\
    --name jenkins-slave\
    -v /var/run/docker.sock:/var/run/docker.sock\
    bmst/jenkins-slave

