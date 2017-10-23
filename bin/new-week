#!/usr/bin/env bash

set -e

WEEK_FORMAT='%W'
YEAR_FORMAT='%Y'
DAY_FORMAT='%Y.%m.%d'

compute_week_file_name() {
    #
    # Computes the file name to edit for a weekly view, starting
    # from the index of the week. 0 is the current week, -1 is
    # last week, 1 is next week, etc.
    #
    if [[ $1 == "" ]]; then
        computed_week=$(date "+$WEEK_FORMAT")
        computed_year=$(date "+$YEAR_FORMAT")
    else # not [[ $1 == "" ]]
        computed_week=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $WEEK_FORMAT ${1}w)
        computed_year=$(dateutils.dadd -i $DAY_FORMAT $(date "+$DAY_FORMAT") -f $YEAR_FORMAT ${1}w)
    fi   # else [[ $1 == "" ]]

    echo "$HOME/learn/learn/plan/$computed_year/weekly/${week_prefix}_week$computed_week.adoc"
}

read_week_prefix() {
    #
    # Reads the week prefix if is set in the given argument.
    # Returns "home" or "work" depending on what is set.
    #
    if [[ "-w" == "$1" ]]; then
        week_prefix="work"
        echo "$week_prefix"
    fi

    if [[ "-h" == "$1" || "-p" == "$1" ]]; then
        week_prefix="home"
        echo "$week_prefix"
    fi # [[ "-h" == "$1" || "-p" == "$1" ]]
}

#
# Find the source of the plan, that can be either `home` or `work`.
# 1. This checks any `-h` or `-w` arguments, else
# 2. it reads the CIPLOGIC_PLAN_SCOPE environment variable
# 3. else it defaults to "home".
#
week_prefix="home"
read_week_prefix $CIPLOGIC_PLAN_SCOPE

READ_WEEK=$(read_week_prefix $1)
if [[ "$READ_WEEK" != "" ]]; then
    echo "read week redurned: $READ_WEEK"
    week_prefix="$READ_WEEK"
    shift
fi

if [[ "$@" != "" ]]; then
    weeks_from_user="$@"
else # not [[ "$1" != "" ]]
    weeks_from_user="0"
fi   # else [[ "$1" != "" ]]


IFS=', ' read -r -a weeks_planned <<< "$weeks_from_user"

mkdir -p $HOME/learn/learn/plan/$computed_year/weekly/

for week in "${weeks_planned[@]}"; do
    files_to_edit="$files_to_edit $(compute_week_file_name $week)"
done

vim -p $files_to_edit

