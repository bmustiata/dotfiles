function! Ariadne()
    if &filetype =~ 'X_Ariadne'
        let l:newType = substitute(&filetype, 'X_Ariadne\.', '', '')
    else
        let l:newType =  'X_Ariadne.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Ariadne call Ariadne()
