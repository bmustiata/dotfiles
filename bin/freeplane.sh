#!/usr/bin/env bash

set -e

if [[ -d $HOME/programs/freeplane ]]; then
    silent /home/raptor/programs/freeplane/freeplane.sh
    exit 0
fi

mkdir /tmp/freeplanedl
cd /tmp/freeplanedl

if [[ ! -f /tmp/freeplanedl/freeplane_bin-1.8.zip ]]; then
    wget https://liquidtelecom.dl.sourceforge.net/project/freeplane/freeplane%20stable/archive/1.8.0/freeplane_bin-1.8.0.zip
fi

unzip *.zip
rm *.zip
mv freeplane-1.8.0 $HOME/programs/freeplane

silent /home/raptor/programs/freeplane/freeplane.sh

