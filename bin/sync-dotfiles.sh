#!/usr/bin/env bash

DOTFOLDER=$(readlink -f $(dirname $(readlink -f "$0"))/..)
lndir $DOTFOLDER $HOME

