
echo "console on 3270, web on 8038."

docker run -it \
    --rm \
    --name hercules \
    -p 3270:3270 \
    -p 8038:8038 \
    rattydave/docker-ubuntu-hercules-mvs:latest

