#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
  OUTPUT_FILE="values.yaml"
else # not [[ "$1" == "" ]]
  OUTPUT_FILE="$1"
fi   # else [[ "$1" == "" ]]

kubectl get cm operator-config -o jsonpath="{.data.values}" > $OUTPUT_FILE


