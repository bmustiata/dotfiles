function! Ansible()
    if &filetype =~ 'X_Ansible'
        let l:newType = substitute(&filetype, 'X_Ansible\.', '', '')
    else
        let l:newType =  'X_Ansible.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Ansible call Ansible()
