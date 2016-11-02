"
" JavaScript file mappings.
"
function! JsDefaults()
    au BufRead,BufNewFile Gruntfile.js set filetype=Gruntfile.javascript
    au BufRead,BufNewFile gulpfile.js set filetype=gulpfile.javascript
    au BufRead,BufNewFile *.json set filetype=json.javascript
    au BufRead,BufNewFile package.json set filetype=package_json.json.javascript
    au BufRead,BufNewFile *test.js set filetype=mocha_test.javascript
    au BufRead,BufNewFile *Test.js set filetype=mocha_test.javascript
    au BufRead,BufNewFile tsconfig.json set filetype=tsconfig.json.javascript
endfunction
call JsDefaults()

function! JsSuperb()
    au BufRead,BufNewFile *.js set filetype=superb_js.javascript
    call JsDefaults()
    set filetype=superb_js.javascript
endfunction
command JsSuperb call JsSuperb()

function! JsVanilla()
    au BufRead,BufNewFile *.js set filetype=javascript
    call JsDefaults()
    set filetype=javascript
endfunction
command JsVanilla call JsVanilla()


