#!/usr/bin/env bash

CURRENT_DIR=$(readlink -f $(dirname $(readlink -f "$0")))

$CURRENT_DIR/sync-learn.sh
$CURRENT_DIR/pull-push-sync-dotfiles.sh

