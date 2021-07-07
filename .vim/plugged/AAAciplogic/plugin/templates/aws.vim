function! AwsCloudFormation()
    if &filetype =~ 'X_AwsCloudFormation'
        let l:newType = substitute(&filetype, 'X_AwsCloudFormation\.', '', '')
    else
        let l:newType =  'X_AwsCloudFormation.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command Aws call AwsCloudFormation()
