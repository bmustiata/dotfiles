docker run --rm \
    -it \
    --network host \
    redis \
    redis-cli $@

