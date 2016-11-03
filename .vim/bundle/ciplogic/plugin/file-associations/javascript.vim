"
" JavaScript file mappings.
"
function! JsDefaults()
    au BufRead,BufNewFile Gruntfile.js set filetype=Gruntfile.js_es5.javascript
    au BufRead,BufNewFile gulpfile.js set filetype=gulpfile.js_es5.javascript
    au BufRead,BufNewFile *test.js set filetype=mocha_test.js_es5.javascript
    au BufRead,BufNewFile *Test.js set filetype=mocha_test.js_es5.javascript
endfunction

function! JsSuperb()
    au BufRead,BufNewFile *.js set filetype=js_superb.js_es5.javascript
    call JsDefaults()
    set filetype=js_superb.js_es5.javascript
endfunction
command JsSuperb call JsSuperb()

function! JsVanilla()
    au BufRead,BufNewFile *.js set filetype=js_es5.javascript
    call JsDefaults()
    set filetype=js_es5.javascript
endfunction
command JsVanilla call JsVanilla()

call JsVanilla()
