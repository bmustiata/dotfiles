#!/usr/bin/env bash

if [[ ! -d ~/learn ]]; then
    exit 0
fi

cd ~/learn
./sync.sh

