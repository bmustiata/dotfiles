#!/usr/bin/env bash

TARGET_SYSTEM_VERSION="1"
CURRENT_SYSTEM_VERSION=$(cat $HOME/.ciplogicdataversion)

#############################################################################
# Do an incremental update of the packages and installed software on the
# system.
#############################################################################
case "$CURRENT_SYSTEM_VERSION" in
    "")
        wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
        nvm install v6

        npm install -g npm

        npm install -g project-archer
        npm install -g fast-live-reload
        npm install -g version-manager

        # for all the sweet projects in the .projects folder
        nmp install -g ars

        # needed by the befautify commands in vim
        npm install -g js-beautify

        npm install -g eslint
        npm install -g eslint-plugin-import
        npm install -g eslint-config-airbnb-base

        # static site generation
        npm install -g hexo
        ;;&
    "0")
        sudo apt install dateutils
esac

echo "$TARGET_SYSTEM_VERSION" > $HOME/.ciplogicdataversion

