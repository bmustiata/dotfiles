
docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /opt/jenkins_home:/var/jenkins_home \
    -p 8080:8080 \
    --name jenkins \
    bmst/jenkins2

