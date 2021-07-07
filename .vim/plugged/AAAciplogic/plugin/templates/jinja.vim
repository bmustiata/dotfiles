function! Jinja()
  if &filetype =~ 'X_Jinja'
    let l:newType = substitute(&filetype, 'X_Jinja\.', '', '')
  else
    let l:newType =  'X_Jinja.' . &filetype
  endif

  execute 'set filetype=' . l:newType
endfunction
command Jinja call Jinja()

