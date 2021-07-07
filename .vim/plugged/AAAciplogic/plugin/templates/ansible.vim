function! Ansible()
    if &filetype =~ 'X_Ansible'
        let l:newType = substitute(&filetype, 'X_Ansible\.', '', '')
    else
        let l:newType =  'X_Ansible.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Ansible call Ansible()

function! AnsibleInventory()
    if &filetype =~ 'X_AnsibleInventory'
        let l:newType = substitute(&filetype, 'X_AnsibleInventory\.', '', '')
    else
        let l:newType =  'X_AnsibleInventory.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command AnsibleInventory call AnsibleInventory()
