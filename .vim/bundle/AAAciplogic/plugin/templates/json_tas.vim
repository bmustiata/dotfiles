function! JsonTas()
    if &filetype =~ 'X_JsonTas'
        let l:newType = substitute(&filetype, 'X_JsonTas\.', '', '')
    else
        let l:newType =  'X_JsonTas.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction

command JsonTas call JsonTas()
