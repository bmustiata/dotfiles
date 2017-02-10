#!/usr/bin/env bash

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)

cd $DOTFOLDER

echo git commit -a -m "sync"
git commit -a -m "sync"

# If the commit is empty, it might fail, so we set -e
# after we try to do the commit.
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

