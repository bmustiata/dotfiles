#!/usr/bin/env bash

lndir $(readlink -f "$(dirname $0)/..") $HOME

