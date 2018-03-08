#!/usr/bin/env bash

docker run -it \
    --rm \
    -v $(pwd):'/src' \
    pyinst-36

