#!/usr/bin/env bash

docker run -d \
    --name nexus \
    -v /opt/nexus-data:/nexus-data \
    -p 8081:8081 \
    sonatype/nexus3

