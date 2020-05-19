

docker run -d \
    --rm \
    --name pgadmin \
    -e PGADMIN_DEFAULT_PASSWORD=postgres \
    -e PGADMIN_DEFAULT_EMAIL=wut@wut.com\
    -p 9091:80 \
    dpage/pgadmin4
