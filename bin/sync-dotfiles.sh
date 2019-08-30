#!/usr/bin/env bash

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)

$DOTFOLDER/bin/lndir.py $DOTFOLDER $HOME

find $HOME/.vim -xtype l -delete
find $HOME/.projects -xtype l -delete

