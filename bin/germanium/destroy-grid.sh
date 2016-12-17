#!/usr/bin/env bash

docker kill germanium-hub
docker kill germanium-node-chrome
docker kill germanium-node-firefox
docker rm -v germanium-hub
docker rm -v germanium-node-chrome
docker rm -v germanium-node-firefox
