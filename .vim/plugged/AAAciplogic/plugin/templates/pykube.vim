function! PyKube()
    if &filetype =~ 'X_PyKube'
        let l:newType = substitute(&filetype, 'X_PyKube\.', '', '')
    else
        let l:newType =  'X_PyKube.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command PyKube call PyKube()

