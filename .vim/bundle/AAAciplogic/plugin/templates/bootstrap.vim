function! Bootstrap()
    if &filetype =~ 'bootstrap_html'
        let l:newType = substitute(&filetype, 'bootstrap_html\.', '', '')
    else
        let l:newType =  'bootstrap_html.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Bootstrap call Bootstrap()
