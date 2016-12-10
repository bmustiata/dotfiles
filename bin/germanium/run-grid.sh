#!/usr/bin/env bash

docker run -d --name germanium-hub -p 4444:4444 germaniumhq/hub:1.10.4
docker run -d --name germanium-chrome-node -p 15901:5901 --link germanium-hub:hub germaniumhq/node-chrome:1.10.4
docker run -d --name germanium-firefox-node -p 15902:5901 --link germanium-hub:hub germaniumhq/node-firefox:1.10.4

