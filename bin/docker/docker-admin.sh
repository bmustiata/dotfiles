

docker run --net=host --ipc=host --uts=host --pid=host -it --security-opt=seccomp=unconfined --privileged --rm -v /:/host -u 0:0 osexp2000/ubuntu-with-utils /bin/bash

