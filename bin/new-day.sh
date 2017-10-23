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

    echo "$HOME/learn/learn/plan/$computed_year/daily/${day_prefix}_$computed_day.adoc"
}

read_day_prefix() {
    #
    # Reads the day prefix if is set in the given argument.
    # Returns "home" or "work" depending on what is set.
    #
    if [[ "-w" == "$1" ]]; then
        day_prefix="work"
        echo "$day_prefix"
    fi

    if [[ "-h" == "$1" || "-p" == "$1" ]]; then
        day_prefix="home"
        echo "$day_prefix"
    fi # [[ "-h" == "$1" || "-p" == "$1" ]]
}

#
# Find the source of the plan, that can be either `home` or `work`.
# 1. This checks any `-h` or `-w` arguments, else
# 2. it reads the CIPLOGIC_PLAN_SCOPE environment variable
# 3. else it defaults to "home".
#
day_prefix="home"
read_day_prefix $CIPLOGIC_PLAN_SCOPE

READ_DAY=$(read_day_prefix $1)
if [[ "$READ_DAY" != "" ]]; then
    day_prefix="$READ_DAY"
    shift
fi

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

