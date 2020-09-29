#!/usr/bin/env bash

set -e

docker rm -f kibana || true

docker run -d \
    --name kibana \
    --network host \
    kibana:7.5.2
