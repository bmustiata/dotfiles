#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
    echo "You need to call: blog-mini-photo.sh source_image.whatever"
    exit 1
fi # [[ "$2" == "" || "$1" == "" ]]

#convert $1 -trim +repage -resize '1280x720^' -gravity center -background transparent -extent 1280x720 $2
convert $1 -resize '262x147^' -gravity south -extent 262x147 "jpg:${1}_small"

