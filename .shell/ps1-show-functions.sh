function ps1-show() {
    for f in $@; do
        export PS1_SHOW_${f^^}=1
    done
}

function ps1-hide() {
    for f in $@; do
        unset PS1_SHOW_${f^^}
    done
}
