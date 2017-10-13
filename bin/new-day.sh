#!/usr/bin/env bash

set -e

DAY_FORMAT='%Y.%m.%d'
YEAR_FORMAT='%Y'

if [[ $1 == "" ]]; then
    COMPUTED_DAY=$(date "+$DAY_FORMAT")
    COMPUTED_YEAR=$(date "+$YEAR_FORMAT")
else # not [[ $1 == "" ]]
    COMPUTED_DAY=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $DAY_FORMAT ${1}d)
    COMPUTED_YEAR=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $YEAR_FORMAT ${1}d)
fi   # else [[ $1 == "" ]]

mkdir -p $HOME/learn/learn/plan/$COMPUTED_YEAR/daily/
DAILY_FILE="$HOME/learn/learn/plan/$COMPUTED_YEAR/daily/$COMPUTED_DAY.adoc"
vim $DAILY_FILE

