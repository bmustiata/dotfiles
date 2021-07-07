function! Adhesive()
    if &filetype =~ 'X_Adhesive'
        let l:newType = substitute(&filetype, 'X_Adhesive\.', '', '')
    else
        let l:newType =  'X_Adhesive.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Adhesive call Adhesive()
