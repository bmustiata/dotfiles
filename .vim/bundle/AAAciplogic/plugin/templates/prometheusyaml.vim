function! PrometheusYaml()
    if &filetype =~ 'X_PrometheusYaml'
        let l:newType = substitute(&filetype, 'X_PrometheusYaml\.', '', '')
    else
        let l:newType =  'X_PrometheusYaml.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command PrometheusYaml call PrometheusYaml()
