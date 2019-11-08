function ps1-show() {
    export PS1_SHOW_${1^^}=1
}

function ps1-hide() {
    unset PS1_SHOW_${1^^}
}
