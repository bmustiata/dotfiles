#!/usr/bin/env bash

set -e

mkdir -p $HOME/learn/learn/plan/daily/
DAILY_FILE="$HOME/learn/learn/plan/daily/$(date '+%Y.%m.%d').adoc"
vim $DAILY_FILE

