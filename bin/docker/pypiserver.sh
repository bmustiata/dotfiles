docker run \
    --name=nexus \
    --volume="/home/raptor/tmp/pypi/_htaccess:/.htaccess:ro" \
    --volume="/home/raptor/tmp/pypi/packages:/home/pypiserver/packages" \
    --volume="/data/packages" \
    -p 8081:8080 \
    --restart=no \
    pypiserver -P /.htaccess -v --overwrite

