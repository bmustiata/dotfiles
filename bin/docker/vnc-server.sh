docker run --name vnc-server \
    --rm \
    -d \
    -e VNC_PASSWORD=germanium \
    -e XFB_SCREEN=1920x1080x24 \
    -p 5901:5900 \
    -p 6001:6000 \
    bmst/x11server

sleep 5 && docker exec -it vnc-server xhost +
