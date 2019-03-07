"
" Asciidoc
"
function! AsciiDocFile()
    set filetype=asciidoc
    NextWordy
endfunction

au BufRead,BufNewFile *.adoc call AsciiDocFile()
au BufRead,BufNewFile *.ad call AsciiDocFile()


