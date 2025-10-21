function! PyOpenAi()
    if &filetype =~ 'X_PyOpenAi'
        let l:newType = substitute(&filetype, 'X_PyOpenAi\.', '', '')
    else
        let l:newType =  'X_PyOpenAi.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command PyOpenAi call PyOpenAi()
