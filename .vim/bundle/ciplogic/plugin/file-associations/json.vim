"
" JSON file mappings.
"

function! JsonDefaults()
    au BufRead,BufNewFile *.json set filetype=X_json.json
    au BufRead,BufNewFile package.json set filetype=json_package.X_json.json
    au BufRead,BufNewFile tsconfig.json set filetype=json_tsconfig.X_json.json
    au BufRead,BufNewFile build.json set filetype=json_yui3_config.X_json.json
endfunction
call JsonDefaults()

