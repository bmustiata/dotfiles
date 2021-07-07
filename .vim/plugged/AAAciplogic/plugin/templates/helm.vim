function! Helm()
    if &filetype =~ 'X_Helm'
        let l:newType = substitute(&filetype, 'X_Helm\.', '', '')
    else
        let l:newType =  'X_Helm.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Helm call Helm()
