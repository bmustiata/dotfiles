#!/usr/bin/env bash


print_usage() {
cat << EOM
Usage: gif-create.sh input-file output-gif-name [scaling-factor]

Scaling factor is implicitly 1.0
EOM
}

if [[ "$2" == "" ]]; then
    print_usage
    exit 1
fi # [[ "$2" == "" ]]

if [[ "$3" == "" ]]; then
    SCALING_FACTOR="1.0"
else # not [[ "$3" == "" ]]
    SCALING_FACTOR="$3"
fi   # else [[ "$3" == "" ]]

echo "Scaling factor is: $3"

docker run \
    --rm \
    -v $(readlink -f $1):/tmp/in/test.avi \
    -v $(readlink -f $(dirname $2)):/tmp/write \
    -e OUTPUT_FILE_NAME=$(basename $2) \
    -e SCALING_FACTOR=$SCALING_FACTOR \
    bmst/gif-create
