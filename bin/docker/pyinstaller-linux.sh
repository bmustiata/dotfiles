#!/usr/bin/env bash

docker run -it \
    --rm \
    -v $(pwd):'/src' \
    cdrx/pyinstaller-linux:python2

