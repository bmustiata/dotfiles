#!/usr/bin/env bash

__kubens_complete() {
    ITEMS=$(kubectl get ns -o jsonpath='{.items[*].metadata.name}')
    COMPREPLY=($(compgen -W "$ITEMS" "${COMP_WORDS[1]}"))
}

complete -F __kubens_complete kubens

