function! PyMcp()
    if &filetype =~ 'X_PyMcp'
        let l:newType = substitute(&filetype, 'X_PyMcp\.', '', '')
    else
        let l:newType =  'X_PyMcp.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command PyMcp call PyMcp()
