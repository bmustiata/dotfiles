function! Diction()
    cexpr system('diction -s ' . shellescape(expand('%:f')))
    copen
endfunction

function! EnableDiction()
    autocmd! BufWritePost *.adoc Diction
endfunction

command EnableDiction call EnableDiction()
command Diction call Diction()
