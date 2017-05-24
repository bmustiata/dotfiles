#!/usr/bin/env bash

ultisnippets2vscode -t X_ts.typescript \
    --out ${HOME}/.config/Code/User/snippets/typescript.json
ultisnippets2vscode -t X_tsx.X_ts.typescript \
    --out ${HOME}/.config/Code/User/snippets/typescriptreact.json

# vue
ultisnippets2vscode -t X_vue.X_css.X_xml.X_html.X_js_es2017.vue \
    --out ${HOME}/.config/Code/User/snippets/vue.json

