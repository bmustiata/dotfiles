#!/usr/bin/env bash

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install v6

npm install -g npm

npm install -g project-archer
npm install -g fast-live-reload
npm install -g version-manager

# needed by the befautify commands in vim
npm install -g js-beautify

npm install -g eslint
npm install -g eslint-plugin-import
npm install -g eslint-config-airbnb-base

