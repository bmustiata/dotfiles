#!/usr/bin/env bash

set -e

mkdir -p $HOME/learn/learn/plan/weekly/
WEEKLY_FILE="$HOME/learn/learn/plan/weekly/week$(date '+%W').adoc"
vim $WEEKLY_FILE

