function! MavenSettings()
    if &filetype =~ 'X_MavenSettings'
        let l:newType = substitute(&filetype, 'X_MavenSettings\.', '', '')
    else
        let l:newType =  'X_MavenSettings.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command MavenSettings call MavenSettings()
