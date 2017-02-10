#!/usr/bin/env bash

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)

cd $DOTFOLDER

echo git commit -a -m "sync"
git commit -a -m "sync"

set -e

echo git pull --rebase
git pull --rebase

echo git submodule init
git submodule init

echo git submodule update
git submodule update

bin/sync-dotfiles.sh

echo "PUSHING changes. Feel free to cancel if on unsecure systems"
git push

