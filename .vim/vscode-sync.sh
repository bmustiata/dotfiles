#!/usr/bin/env bash

ultisnippets2vscode -t typescript.X_vue \
    --out ${HOME}/programs/VSCode-linux-x64/resources/app/extensions/typescript/snippets/typescript.json
ultisnippets2vscode -t X_tsx.X_ts.typescript \
    --out ${HOME}/programs/VSCode-linux-x64/resources/app/extensions/typescript/snippets/typescriptreact.json

