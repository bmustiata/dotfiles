CURDIR=$(readlink -f "$(dirname "$0")")
PER_FILE_SYNTAX_COLORING_FOLDER=$(readlink -f "$(dirname "$0")/../ftplugin")
CORE_VIM_PARTS_COLORING_FOLDER=$(readlink -f "$(dirname "$0")/../colors/_parts")

flr -o $PER_FILE_SYNTAX_COLORING_FOLDER $CORE_VIM_PARTS_COLORING_FOLDER -e $CURDIR/update-theme.py

