if &g:background=="light"
  hi LspErrorText guifg=#de0000 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=160 ctermbg=252 cterm=bold
  hi LspWarningText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi LspInformationText guifg=#00d700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=28 ctermbg=252 cterm=bold
  hi LspHintText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi LspCodeActionText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
else
  hi LspErrorText guifg=#FF6262 guibg=#262626 guisp=NONE gui=italic ctermfg=160 ctermbg=235 cterm=bold
  hi LspWarningText guifg=#ae5c00 guibg=#262626 guisp=NONE gui=NONE ctermfg=208 ctermbg=235 cterm=NONE
  hi LspInformationText guifg=#56e156 guibg=#262626 guisp=NONE gui=NONE ctermfg=77 ctermbg=235 cterm=NONE
  hi LspHintText guifg=#ae5c00 guibg=#262626 guisp=NONE gui=NONE ctermfg=208 ctermbg=235 cterm=NONE
  hi LspCodeActionText guifg=#ae5c00 guibg=#262626 guisp=NONE gui=NONE ctermfg=208 ctermbg=235 cterm=NONE
endif

