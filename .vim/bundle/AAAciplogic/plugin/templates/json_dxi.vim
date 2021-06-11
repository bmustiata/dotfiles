function! JsonTas()
    if &filetype =~ 'X_JsonTas'
        let l:newType = substitute(&filetype, 'X_JsonTas\.', '', '')
    else
        let l:newType =  'X_JsonTas.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command JsonTas call JsonTas()

function! JsonNass()
    if &filetype =~ 'X_JsonNass'
        let l:newType = substitute(&filetype, 'X_JsonNass\.', '', '')
    else
        let l:newType =  'X_JsonNass.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command JsonNass call JsonNass()
