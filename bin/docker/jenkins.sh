
docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/jenkins_home:/var/jenkins_home \
    -p 18080:8080 \
    --name jenkins \
    bmst/jenkins2

