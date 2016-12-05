"
" JavaScript file mappings.
"
function! JsDefaults()
    au BufRead,BufNewFile Gruntfile.js set filetype=Gruntfile.X_js_es5.javascript
    au BufRead,BufNewFile gulpfile.js set filetype=gulpfile.X_js_es5.javascript
    au BufRead,BufNewFile *test.js set filetype=mocha_test.X_js_es5.javascript
    au BufRead,BufNewFile *Test.js set filetype=mocha_test.X_js_es5.javascript
endfunction
command JsDefaults call JsDefaults()

function! JsSuperb()
    au BufRead,BufNewFile *.js set filetype=js_superb.X_js_es5.javascript
    call JsDefaults()
    set filetype=js_superb.X_js_es5.javascript
endfunction
command JsSuperb call JsSuperb()

function! JsComposer()
    au BufRead,BufNewFile *.js set filetype=js_composer.js_yui3.X_js_es5.javascript
    call JsDefaults()
    set filetype=js_composer.js_yui3.X_js_es5.javascript
endfunction
command JsComposer call JsComposer()

function! JsVanilla()
    au BufRead,BufNewFile *.js set filetype=X_js_es5.javascript
    call JsDefaults()
    set filetype=X_js_es5.javascript
endfunction
command JsVanilla call JsVanilla()

function! JsGermanium()
    au BufRead,BufNewFile *.js set filetype=js_germanium.javascript
    call JsDefaults()
    set filetype=js_germanium.javascript
endfunction
command JsGermanium call JsGermanium()

function! JsES2017()
  au BufRead,BufNewFile *.js set filetype=X_js_es2017.javascript
  call JsDefaults()
  set filetype=X_js_es2017.javascript
endfunction
command JsES2017 call JsES2017()

"
" call JsComposer()
"
" This is a JsComposer call, without the set filetype, since this will be
" applied for every opened file in every new instance.
"
au BufRead,BufNewFile *.js set filetype=js_composer.js_yui3.X_js_es5.javascript
call JsDefaults()
"set filetype=js_composer.js_yui3.X_js_es5.javascript
"
