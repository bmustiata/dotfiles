#!/usr/bin/env bash

if [[ "$2" == "" || "$1" == "" ]]; then
    echo "You need to call: blog-photo.sh source_image.whatever output_image.png"
    exit 1
fi # [[ "$2" == "" || "$1" == "" ]]

#convert $1 -trim +repage -resize '1280x720^' -gravity center -background transparent -extent 1280x720 $2
convert $1 -resize '847x300^' -gravity center $2
convert $1 -resize '262x147^' -gravity south -extent 262x147 "jpg:${2}_small"

