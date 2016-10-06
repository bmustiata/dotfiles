#!/usr/bin/env bash

set -e

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)

cd $DOTFOLDER
git pull --rebase
git submodule init
git submodule update
bin/sync-dotfiles.sh

echo "PUSHING changes. Feel free to cancel if on unsecure systems"
git push

