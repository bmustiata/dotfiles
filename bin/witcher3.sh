#!/usr/bin/env bash

export WINE_PREFIX=~/.wine-witcher3/
export WINEPREFIX=~/.wine-witcher3/
setxkbmap us -print | xkbcomp - $DISPLAY

cd "$HOME/.wine-witcher3/drive_c/GOG Games/The Witcher 3 Wild Hunt GOTY/bin/x64/"
wine "witcher3.exe"


