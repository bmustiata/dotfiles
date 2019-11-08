function! Archer()
    if &filetype =~ 'X_Archer'
        let l:newType = substitute(&filetype, 'X_Archer\.', '', '')
        call Spaces2
    else
        let l:newType =  'X_Archer.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Archer call Archer()
