#!/usr/bin/env bash

set -e

CURRENT_DIR=$(readlink -f $(dirname $(readlink -f "$0")))

echo "#############################################################################"
echo "# syncing learn"
echo "#############################################################################"
$CURRENT_DIR/sync-learn.sh

echo "#############################################################################"
echo "# syncing dotfiles"
echo "#############################################################################"
$CURRENT_DIR/pull-push-sync-dotfiles.sh

