function! Netplan()
    if &filetype =~ 'X_Netplan'
        let l:newType = substitute(&filetype, 'X_Netplan\.', '', '')
    else
        let l:newType =  'X_Netplan.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Netplan call Netplan()
