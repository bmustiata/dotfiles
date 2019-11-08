function! Python()
    if &filetype =~ 'X_Python'
        let l:newType = substitute(&filetype, 'X_Python\.', '', '')
    else
        let l:newType =  'X_Python.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Python call Python()
