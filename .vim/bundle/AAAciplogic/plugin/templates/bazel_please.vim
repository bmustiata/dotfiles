function! Bazel()
    if &filetype =~ 'X_Bazel'
        let l:newType = substitute(&filetype, 'X_Bazel\.', '', '')
    else
        let l:newType =  'X_Bazel.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Bazel call Bazel()


function! Please()
    if &filetype =~ 'X_Please'
        let l:newType = substitute(&filetype, 'X_Please\.', '', '')
    else
        let l:newType =  'X_Please.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Please call Please()
