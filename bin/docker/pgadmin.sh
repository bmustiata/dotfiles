

echo "USER: wut@wut.com"
echo "PASS: wut"
echo "http://localhost:9091/"

docker run -d \
    --rm \
    --name pgadmin \
    -e PGADMIN_DEFAULT_PASSWORD=wut \
    -e PGADMIN_DEFAULT_EMAIL=wut@wut.com\
    -v $HOME/programs/pgadmin-data:/var/lib/pgadmin \
    -p 9091:80 \
    dpage/pgadmin4:9.12
