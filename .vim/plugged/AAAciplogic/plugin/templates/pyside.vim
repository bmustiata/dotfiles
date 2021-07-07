function! PySide2()
    if &filetype =~ 'X_PySide2'
        let l:newType = substitute(&filetype, 'X_PySide2\.', '', '')
    else
        let l:newType =  'X_PySide2.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command PySide2 call PySide2()
