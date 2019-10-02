#############################################################################
# Bring up prometheus
#############################################################################
# if we have a prometheus.yml in the local folder we use that one
if [ -f prometheus.yml ]; then
    echo "Using the local prometheus.yml config"
    PROMETHEUS_CONFIG_MOUNT="-v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml:ro"
else
    echo "WARNING: Using the embedded /etc/prometheus/prometheus.yml from the container"
    echo "no local prometheus.yml was found"
fi # [ -f prometheus.yml ]

if [[ "$(ls prometheus.*.yml)" != "" ]]; then
    echo "We have local file configs. Going to mount them in /configs/"
    PROMETHEUS_CONFIG_MOUNT="$PROMETHEUS_CONFIG_MOUNT -v $(pwd)/:/configs/:ro"
fi # [[ "$(ls prometheus.*.yml)" != "" ]]

echo docker run -d \
    -p 19090:9090 \
    --name prometheus \
    $PROMETHEUS_CONFIG_MOUNT \
    prom/prometheus

docker run -d \
    -p 19090:9090 \
    --name prometheus \
    $PROMETHEUS_CONFIG_MOUNT \
    prom/prometheus

