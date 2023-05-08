CURDIR=$(readlink -f "$(dirname "$0")")
PER_FILE_SYNTAX_COLORING_FOLDER=$(readlink -f "$(dirname "$0")/../ftplugin")

flr -o $PER_FILE_SYNTAX_COLORING_FOLDER -e $CURDIR/update-theme.py

