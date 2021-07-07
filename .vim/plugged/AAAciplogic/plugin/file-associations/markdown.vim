function! MarkdownFile()
    set fo=n
    nmap J ggVGP:w<cr>
endfunction

au BufRead,BufNewFile *.md call MarkdownFile()

