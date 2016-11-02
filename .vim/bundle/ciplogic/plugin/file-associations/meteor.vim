"
" Associate settigns for Meteor editing.
"
function! JsMeteor()
    au BufRead,BufNewFile *.html set filetype=meteor_html.bootstrap_html.handlebars.xml.html
    au BufRead,BufNewFile *.js set filetype=meteor_js.jquery_js.javascript
endfunction
command JsMeteor call JsMeteor()

