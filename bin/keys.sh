#!/usr/bin/env bash

yad=$(which yad)

setkeyboard() {
    if [[ "$1" == "co" ]]; then
        setxkbmap us -variant colemak -print | xkbcomp - $DISPLAY
        echo "Reset the keys as colemak"
        exit 0
    fi # [[ "$1" == "co" ]]

    if [[ "$1" == "ro" ]]; then
        setxkbmap ro -variant std -print | xkbcomp - $DISPLAY
        echo "Reset the keys as Romanian"
        exit 0
    fi # [[ "$1" == "ro" ]]

    if [[ "$1" == "de" ]]; then
        setxkbmap de -print | xkbcomp - $DISPLAY
        echo "Reset the keys as German"
        exit 0
    fi # [[ "$1" == "de" ]]

    setxkbmap us -print | xkbcomp - $DISPLAY
    echo "Reset the keys as US standard"
}

if [[ "$yad" != "" ]]; then
    KEYBOARD=$($yad --entry co ro de us)
    setkeyboard $KEYBOARD
    exit 0
fi # [[ "$yad" != "" ]]

setkeyboard $1
