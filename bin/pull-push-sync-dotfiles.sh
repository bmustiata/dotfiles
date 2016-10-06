#!/usr/bin/env bash

set -e

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)

cd $DOTFOLDER
git pull --rebase
git submodule init
git submodule update
git push

bin/sync-dotfiles.sh

