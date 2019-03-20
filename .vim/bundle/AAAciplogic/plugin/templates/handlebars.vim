function! Handlebars()
  if &filetype =~ 'X_Handlebars'
    let l:newType = substitute(&filetype, 'X_Handlebars\.', '', '')
  else
    let l:newType =  'X_Handlebars.' . &filetype
  endif

  execute 'set filetype=' . l:newType
endfunction
command Handlebars call Handlebars()

