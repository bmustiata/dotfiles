function! Ars()
    if &filetype =~ 'X_Ars'
        let l:newType = substitute(&filetype, 'X_Ars\.', '', '')
    else
        let l:newType =  'X_Ars.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Ars call Ars()
