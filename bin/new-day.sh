#!/usr/bin/env bash

set -e

DAY_FORMAT='%Y.%m.%d'
mkdir -p $HOME/learn/learn/plan/daily/

if [[ $1 == "" ]]; then
    COMPUTED_DAY=$(date "+$DAY_FORMAT")
else # not [[ $1 == "" ]]
    COMPUTED_DAY=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $DAY_FORMAT ${1}d)
fi   # else [[ $1 == "" ]]

DAILY_FILE="$HOME/learn/learn/plan/daily/$COMPUTED_DAY.adoc"
vim $DAILY_FILE

