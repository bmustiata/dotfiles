function! TerraformGcp()
    if &filetype =~ 'X_TerraformGcp'
        let l:newType = substitute(&filetype, 'X_TerraformGcp\.', '', '')
    else
        let l:newType =  'X_TerraformGcp.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command TerraformGcp call TerraformGcp()
