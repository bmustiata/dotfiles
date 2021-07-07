function! Vue()
  if &filetype =~ 'X_Vue'
    let l:newType = substitute(&filetype, 'X_Vue\.', '', '')
  else
    let l:newType =  'X_Vue.' . &filetype
  endif

  execute 'set filetype=' . l:newType
endfunction
command Vue call Vue()

