#!/usr/bin/env bash

mkdir /opt/nexus-data
sudo chown 200:200 /opt/nexus-data

docker run -d \
    --name nexus \
    -v /opt/nexus-data:/nexus-data \
    -p 8081:8081 \
    sonatype/nexus3

