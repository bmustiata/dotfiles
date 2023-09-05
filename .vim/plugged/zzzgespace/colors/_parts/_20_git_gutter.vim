if &g:background=="light"
  hi GitGutterAdd guifg=#00d700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=28 ctermbg=252 cterm=bold
  hi GitGutterAddLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterDelete guifg=#de0000 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=160 ctermbg=252 cterm=bold
  hi GitGutterDeleteLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterChangeDeleteLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterChange guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi GitGutterChangeLineNr guifg=#e4e4e4 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=254 ctermbg=252 cterm=NONE
else
  hi GitGutterAdd guifg=#56e156 guibg=#262626 guisp=NONE gui=NONE ctermfg=77 ctermbg=235 cterm=NONE
  hi GitGutterAddLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterDelete guifg=#de0000 guibg=#262626 guisp=NONE gui=bold ctermfg=160 ctermbg=235 cterm=bold
  hi GitGutterDeleteLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterChangeDeleteLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterChange guifg=#ae5c00 guibg=#262626 guisp=NONE gui=NONE ctermfg=208 ctermbg=235 cterm=NONE
  hi GitGutterChangeLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
endif
