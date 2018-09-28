function! Jenkinsfile()
    if &filetype =~ 'X_Jenkinsfile'
        let l:newType = substitute(&filetype, 'X_Jenkinsfile\.', '', '')
    else
        let l:newType =  'X_Jenkinsfile.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Jenkins call Jenkinsfile()
