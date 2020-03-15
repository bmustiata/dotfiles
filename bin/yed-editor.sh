#!/usr/bin/env bash

set -e

if [[ -d "$HOME/programs/yed" ]]; then
  java -jar $HOME/programs/yed/yed.jar
  exit 0
fi

mkdir -p /tmp/yeddl
cd /tmp/yeddl

if [[ ! -f "yEd-3.19.1.1.zip" ]]; then
  wget https://www.yworks.com/resources/yed/demo/yEd-3.19.1.1.zip
fi

unzip yEd-3.19.1.1.zip
rm *.zip
mv * $HOME/programs/yed

java -jar $HOME/programs/yed/yed.jar

