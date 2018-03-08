
docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 18080:8080 \
    --name jenkins \
    bmst/jenkins2

