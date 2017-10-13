#!/usr/bin/env bash

set -e

WEEK_FORMAT='%W'
YEAR_FORMAT='%Y'
DAY_FORMAT='%Y.%m.%d'

if [[ $1 == "" ]]; then
    COMPUTED_WEEK=$(date "+$WEEK_FORMAT")
    COMPUTED_YEAR=$(date "+$YEAR_FORMAT")
else # not [[ $1 == "" ]]
    COMPUTED_WEEK=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $WEEK_FORMAT ${1}w)
    COMPUTED_YEAR=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $YEAR_FORMAT ${1}w)
fi   # else [[ $1 == "" ]]

mkdir -p $HOME/learn/learn/plan/$COMPUTED_YEAR/weekly/
WEEKLY_FILE="$HOME/learn/learn/plan/$COMPUTED_YEAR/weekly/week$COMPUTED_WEEK.adoc"
vim $WEEKLY_FILE

