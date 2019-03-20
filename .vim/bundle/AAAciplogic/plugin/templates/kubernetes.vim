function! Kube()
    if &filetype =~ 'X_Kube'
        let l:newType = substitute(&filetype, 'X_Kube\.', '', '')
    else
        let l:newType =  'X_Kube.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Kube call Kube()
