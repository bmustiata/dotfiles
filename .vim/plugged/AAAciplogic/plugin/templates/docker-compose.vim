function! DockerCompose()
    if &filetype =~ 'X_DockerCompose'
        let l:newType = substitute(&filetype, 'X_DockerCompose\.', '', '')
    else
        let l:newType =  'X_DockerCompose.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command DockerCompose call DockerCompose()
