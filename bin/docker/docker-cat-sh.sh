
CONTAINER_ID=$(docker run -t --rm -d --entrypoint /bin/cat $1)

if [[ "$2" == "" ]]; then
    CONTAINER_COMMAND=/bin/bash
else # not [[ "$2" == "" ]]
    CONTAINER_COMMAND=$2
fi   # else [[ "$2" == "" ]]

docker exec -it $CONTAINER_ID $CONTAINER_COMMAND
docker rm -f $CONTAINER_ID
