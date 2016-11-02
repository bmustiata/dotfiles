"
" Associate PHP (Joomla) files
"
au BufRead,BufNewFile templateDetails.xml set filetype=joomla_template.xml

function! PhpJoomla()
    au BufRead,BufNewFile *.php set filetype=joomla_template.php
endfunction
command PhpJoomla call PhpJoomla()
command JoomlaPhp call PhpJoomla()


