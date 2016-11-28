#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
    echo "You need to pass the image you want the volumer from mounted in." >&2
    exit 1
fi # [[ "$1" == "" ]]

docker run --rm --volumes-from="$1" -it bmst/inspect

