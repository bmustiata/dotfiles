"
" JSON file mappings.
"

function! JsonDefaults()
    au BufRead,BufNewFile *.json set filetype=json.javascript
    au BufRead,BufNewFile package.json set filetype=json_package.json.javascript
    au BufRead,BufNewFile tsconfig.json set filetype=json_tsconfig.json.javascript
    au BufRead,BufNewFile build.json set filetype=json_yui3_config.json.javascript
endfunction
call JsonDefaults()

