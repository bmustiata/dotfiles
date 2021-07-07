function! Asciidoc()
    if &filetype =~ 'X_Asciidoc'
        let l:newType = substitute(&filetype, 'X_Asciidoc\.', '', '')
    else
        let l:newType =  'X_Asciidoc.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Asciidoc call Asciidoc()
