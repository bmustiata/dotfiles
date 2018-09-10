#!/usr/bin/env bash

set -e

ARCHIVE=$(readlink -f $(ls -t ~/Downloads/code-stable-*.tar.gz | head -n 1))

rm -fr ~/programs/VSCode-linux-x64
cd ~/programs
echo "Using: $ARCHIVE"
tar -zxf $ARCHIVE
#rm ~/Downloads/code-stable-code_*.tar.gz

