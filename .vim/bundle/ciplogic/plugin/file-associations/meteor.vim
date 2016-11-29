"
" Associate settigns for Meteor editing.
"
function! JsMeteor()
    au BufRead,BufNewFile *.html set filetype=meteor_html.bootstrap_html.X_handlebars.X_xml.X_html.html
    au BufRead,BufNewFile *.js set filetype=js_meteor.js_jquery.js_es5.javascript
endfunction
command JsMeteor call JsMeteor()

