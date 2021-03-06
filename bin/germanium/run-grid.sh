#!/usr/bin/env bash

#
# Destroy first the currently existing grid.
#
$(readlink -f $(dirname $(readlink -f "$0")))/destroy-grid.sh

#
# Create a new grid
#
docker run -d --name germanium-hub -p 4444:4444 germaniumhq/hub:1.10.4
docker run -d --name germanium-node-chrome -e NODE_MAX_SESSION=10 -e NODE_MAX_INSTANCES=10 -p 15901:5901 --link germanium-hub:hub germaniumhq/node-chrome:1.10.4
docker run -d --name germanium-node-firefox -e NODE_MAX_SESSION=10 -e NODE_MAX_INSTANCES=10 -p 15902:5901 --link germanium-hub:hub germaniumhq/node-firefox:1.10.4

