if &g:background=="light"
  " vim UI
  " general
  hi Normal guifg=#121212 guibg=#e4e4e4 guisp=NONE gui=NONE ctermfg=233 ctermbg=254 cterm=NONE
  hi LineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi SignColumn guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi Visual guifg=#e4e4e4 guibg=#034D6D guisp=NONE gui=NONE ctermfg=233 ctermbg=74 cterm=NONE
  " gutter + line number
  hi CursorLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=233 ctermbg=252 cterm=bold
  " menu + split
  hi VertSplit guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi PMenu guifg=#e4e4e4 guibg=#444444 guisp=NONE gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
  hi PMenuSel guifg=#000000 guibg=#ffaf5f guisp=NONE gui=NONE ctermfg=0 ctermbg=215 cterm=NONE
  " nerdtree selection + cursor line
  hi CursorLine guifg=#e4e4e4 guibg=#05638C
  " vim tabs
  hi TabLineFill guibg=#e4e4e4 guifg=#444444
  hi TabLineSel guibg=#e4e4e4 guifg=#AE5C00 gui=bold guisp=NONE
  hi TabLine guibg=#444444 guifg=#e4e4e4 gui=NONE guisp=NONE
  " vim search
  hi Search guifg=#e4e4e4 guibg=#034d6d gui=italic
else
  " background=="dark"
  " vim UI
  " general
  hi Normal guifg=#e4e4e4 guibg=#121212 guisp=NONE gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
  hi LineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi SignColumn guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi Visual guifg=#e4e4e4 guibg=#034d6d guisp=NONE gui=NONE ctermfg=254 ctermbg=23 cterm=NONE
  " gutter + line number
  hi CursorLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=bold ctermfg=254 ctermbg=235 cterm=bold
  " menu + split
  hi VertSplit guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi PMenu guifg=#e4e4e4 guibg=#444444 guisp=NONE gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
  hi PMenuSel guifg=#121212 guibg=#ffaf5f guisp=NONE gui=NONE ctermfg=233 ctermbg=215 cterm=NONE
  " nerdtree selection + cursor line
  hi CursorLine guifg=#e4e4e4 guibg=#034D6D
  " vim tabs
  hi TabLineFill guibg=#121212 guifg=#444444
  hi TabLineSel guibg=#121212 guifg=#FFB562 gui=bold guisp=NONE
  hi TabLine guibg=#444444 guifg=#e4e4e4 gui=NONE guisp=NONE
  " vim search
  hi Search guifg=#121212 guibg=#05638c gui=italic
endif

