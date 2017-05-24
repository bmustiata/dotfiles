#!/usr/bin/env bash

set -e

rm -fr ~/programs/VSCode-linux-x64
cd ~/programs
tar -zxvf $(readlink -f $(ls -t ~/Downloads/code-stable-code*.tar.gz | head -n 1))
#rm ~/Downloads/code-stable-code_*.tar.gz

