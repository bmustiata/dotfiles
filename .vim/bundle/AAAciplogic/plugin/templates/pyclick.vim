function! PyClick()
    if &filetype =~ 'X_PyClick'
        let l:newType = substitute(&filetype, 'X_PyClick\.', '', '')
    else
        let l:newType =  'X_PyClick.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command PyClick call PyClick()
