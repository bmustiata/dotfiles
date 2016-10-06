#!/usr/bin/env bash

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)

cd $DOTFOLDER
git pull --rebase
git push
./sync-dotfiles.sh

