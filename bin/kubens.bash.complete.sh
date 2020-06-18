#!/usr/bin/env bash

__kubens_complete() {
    ITEMS=$(kubectl get ns -o jsonpath='{.items[*].metadata.name}')
    COMPREPLY=($(compgen -W "$ITEMS" "${COMP_WORDS[1]}"))
}

complete -F __kubens_complete kubens

#############################################################################
# kubectl completion
#############################################################################
__kubectl_get_available_objects() {
    OBJECT_TYPE="$2"

    case "$OBJECT_TYPE" in
        "edit"|"delete"|"apply"|"create"|"describe")
            kubectl api-resources --no-headers | cut -f1 -d\ 
        ;;
        "logs")
            OBJECT_TYPE="pods"
            kubectl get --no-headers $OBJECT_TYPE | tr -s " " | perl -pe 's/(.*?)\s+(.*?)/\1  \2/'
            kubectl get $OBJECT_TYPE --no-headers --all-namespaces | tr -s " " | perl -pe 's/(.*?)\s+(.*?)\s+(.*)/\1\/\2  \3/'
        ;;
        *)
            kubectl get --no-headers $OBJECT_TYPE | tr -s " " | perl -pe 's/(.*?)\s+(.*?)/\1  \2/'
            kubectl get $OBJECT_TYPE --no-headers --all-namespaces | tr -s " " | perl -pe 's/(.*?)\s+(.*?)\s+(.*)/\1\/\2  \3/'
        ;;
    esac

}

__start_kubectl() {
    OBJECT_NAME=$(__kubectl_get_available_objects $@ | fzf | cut -f1 -d\ )
    OBJECT_TYPE="$2"

    if [[ "$OBJECT_NAME" = *"/"* ]]; then
        IFS='/' read -r -a TOKENS <<< "$OBJECT_NAME"
        RESULT="$OBJECT_TYPE --namespace ${TOKENS[0]} ${TOKENS[1]}"
    else # not [[ "$OBJECT_NAME" = *"/"* ]]
        RESULT="$OBJECT_TYPE $OBJECT_NAME"
    fi   # else [[ "$OBJECT_NAME" = *"/"* ]]

    COMPREPLY="$RESULT"
}

complete -F __start_kubectl kubectl

