#!/usr/bin/env bash

#
# MOTD
#
WEEKLY_FILE="$HOME/learn/learn/plan/$(date '+%Y')/weekly/week$(date '+%W').adoc"
if [[ -f $WEEKLY_FILE ]]; then
    cat $WEEKLY_FILE
fi # [[ -f  ]]

DAILY_FILE="$HOME/learn/learn/plan/$(date '+%Y')/daily/$(date '+%Y.%m.%d').adoc"
if [[ -f $DAILY_FILE ]]; then
    cat $DAILY_FILE
fi # [[ -f  ]]

