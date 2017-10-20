#!/usr/bin/env bash

set -e

DAY_FORMAT='%Y.%m.%d'
YEAR_FORMAT='%Y'

compute_file_name() {
    #
    # Computes the file name to edit for a daily view, starting
    # from the index of the day. 0 is the current day, -1 is
    # yesterday, 1 is tomorrow, etc.
    #
    if [[ $1 == "" ]]; then
        computed_day=$(date "+$DAY_FORMAT")
        computed_year=$(date "+$YEAR_FORMAT")
    else # not [[ $1 == "" ]]
        computed_day=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $DAY_FORMAT ${1}d)
        computed_year=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $YEAR_FORMAT ${1}d)
    fi   # else [[ $1 == "" ]]

    echo "$HOME/learn/learn/plan/$computed_year/daily/$computed_day.adoc"
}

if [[ "$@" != "" ]]; then
    days_from_user="$@"
else # not [[ "$1" != "" ]]
    days_from_user="0"
fi   # else [[ "$1" != "" ]]


IFS=', ' read -r -a days_planned <<< "$days_from_user"

mkdir -p $HOME/learn/learn/plan/$computed_year/daily/

for day in "${days_planned[@]}"; do
    files_to_edit="$files_to_edit $(compute_file_name $day)"
done

vim -p $files_to_edit

