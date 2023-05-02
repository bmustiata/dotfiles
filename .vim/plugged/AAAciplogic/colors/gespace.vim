if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

set t_Co=256

" we favor the true color scheme
if (has("termguicolors"))
  set termguicolors
endif

if !empty($GESPACE_THEME)
  if $GESPACE_THEME == "dark"
    set background=dark
  endif

  if $GESPACE_THEME == "light"
    set background=light
  endif

  if $GESPACE_THEME != "dark" && $GESPACE_THEME != "light"
    echom printf("GESPACE_THEME environment variable is defined but is not 'dark' or 'light', is: '%s'", $GESPACE_THEME)
  endif
endif

" -------------------------------------------------------------------------
" The GeSpace Palette
" -------------------------------------------------------------------------

" GeGray0
hi GeGray0 guifg=#262626 guibg=NONE guisp=NONE gui=NONE ctermfg=235 ctermbg=NONE cterm=NONE
hi GeGray0Bold guifg=#262626 guibg=NONE guisp=NONE gui=bold ctermfg=235 ctermbg=NONE cterm=bold
hi GeGray0Italic guifg=#262626 guibg=NONE guisp=NONE gui=italic ctermfg=235 ctermbg=NONE cterm=italic
hi GeGray0BoldItalic guifg=#262626 guibg=NONE guisp=NONE gui=bold,italic ctermfg=235 ctermbg=NONE cterm=bold,italic
" GeGray1
hi GeGray1 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
hi GeGray1Bold guifg=#444444 guibg=NONE guisp=NONE gui=bold ctermfg=238 ctermbg=NONE cterm=bold
hi GeGray1Italic guifg=#444444 guibg=NONE guisp=NONE gui=italic ctermfg=238 ctermbg=NONE cterm=italic
hi GeGray1BoldItalic guifg=#444444 guibg=NONE guisp=NONE gui=bold,italic ctermfg=238 ctermbg=NONE cterm=bold,italic
" GeGray2
hi GeGray2 guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi GeGray2Bold guifg=#6c6c6c guibg=NONE guisp=NONE gui=bold ctermfg=242 ctermbg=NONE cterm=bold
hi GeGray2Italic guifg=#6c6c6c guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=italic
hi GeGray2BoldItalic guifg=#6c6c6c guibg=NONE guisp=NONE gui=bold,italic ctermfg=242 ctermbg=NONE cterm=bold,italic
" GeGray3
hi GeGray3 guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi GeGray3Bold guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold
hi GeGray3Italic guifg=#a8a8a8 guibg=NONE guisp=NONE gui=italic ctermfg=248 ctermbg=NONE cterm=italic
hi GeGray3BoldItalic guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold,italic ctermfg=248 ctermbg=NONE cterm=bold,italic
" GeGray4
hi GeGray4 guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE ctermfg=250 ctermbg=NONE cterm=NONE
hi GeGray4Bold guifg=#bcbcbc guibg=NONE guisp=NONE gui=bold ctermfg=250 ctermbg=NONE cterm=bold
hi GeGray4Italic guifg=#bcbcbc guibg=NONE guisp=NONE gui=italic ctermfg=250 ctermbg=NONE cterm=italic
hi GeGray4BoldItalic guifg=#bcbcbc guibg=NONE guisp=NONE gui=bold,italic ctermfg=250 ctermbg=NONE cterm=bold,italic
" GeGray5
hi GeGray5 guifg=#d0d0d0 guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi GeGray5Bold guifg=#d0d0d0 guibg=NONE guisp=NONE gui=bold ctermfg=252 ctermbg=NONE cterm=bold
hi GeGray5Italic guifg=#d0d0d0 guibg=NONE guisp=NONE gui=italic ctermfg=252 ctermbg=NONE cterm=italic
hi GeGray5BoldItalic guifg=#d0d0d0 guibg=NONE guisp=NONE gui=bold,italic ctermfg=252 ctermbg=NONE cterm=bold,italic
" GeBlack
hi GeBlack guifg=#121212 guibg=NONE guisp=NONE gui=NONE ctermfg=233 ctermbg=NONE cterm=NONE
hi GeBlackBold guifg=#121212 guibg=NONE guisp=NONE gui=bold ctermfg=233 ctermbg=NONE cterm=bold
hi GeBlackItalic guifg=#121212 guibg=NONE guisp=NONE gui=italic ctermfg=233 ctermbg=NONE cterm=italic
hi GeBlackBoldItalic guifg=#121212 guibg=NONE guisp=NONE gui=bold,italic ctermfg=233 ctermbg=NONE cterm=bold,italic
" GeWhite
hi GeWhite guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi GeWhiteBold guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold
hi GeWhiteItalic guifg=#e4e4e4 guibg=NONE guisp=NONE gui=italic ctermfg=254 ctermbg=NONE cterm=italic
hi GeWhiteBoldItalic guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold,italic ctermfg=254 ctermbg=NONE cterm=bold,italic
" GeGreen0
hi GeGreen0 guifg=#008b00 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi GeGreen0Bold guifg=#008b00 guibg=NONE guisp=NONE gui=bold ctermfg=28 ctermbg=NONE cterm=bold
hi GeGreen0Italic guifg=#008b00 guibg=NONE guisp=NONE gui=italic ctermfg=28 ctermbg=NONE cterm=italic
hi GeGreen0BoldItalic guifg=#008b00 guibg=NONE guisp=NONE gui=bold,italic ctermfg=28 ctermbg=NONE cterm=bold,italic
" GeGreen1
hi GeGreen1 guifg=#00b100 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi GeGreen1Bold guifg=#00b100 guibg=NONE guisp=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi GeGreen1Italic guifg=#00b100 guibg=NONE guisp=NONE gui=italic ctermfg=34 ctermbg=NONE cterm=italic
hi GeGreen1BoldItalic guifg=#00b100 guibg=NONE guisp=NONE gui=bold,italic ctermfg=34 ctermbg=NONE cterm=bold,italic
" GeGreen2
hi GeGreen2 guifg=#00d700 guibg=NONE guisp=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi GeGreen2Bold guifg=#00d700 guibg=NONE guisp=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi GeGreen2Italic guifg=#00d700 guibg=NONE guisp=NONE gui=italic ctermfg=40 ctermbg=NONE cterm=italic
hi GeGreen2BoldItalic guifg=#00d700 guibg=NONE guisp=NONE gui=bold,italic ctermfg=40 ctermbg=NONE cterm=bold,italic
" GeGreen3
hi GeGreen3 guifg=#2dda2d guibg=NONE guisp=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi GeGreen3Bold guifg=#2dda2d guibg=NONE guisp=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi GeGreen3Italic guifg=#2dda2d guibg=NONE guisp=NONE gui=italic ctermfg=40 ctermbg=NONE cterm=italic
hi GeGreen3BoldItalic guifg=#2dda2d guibg=NONE guisp=NONE gui=bold,italic ctermfg=40 ctermbg=NONE cterm=bold,italic
" GeGreen4
hi GeGreen4 guifg=#56e156 guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
hi GeGreen4Bold guifg=#56e156 guibg=NONE guisp=NONE gui=bold ctermfg=77 ctermbg=NONE cterm=bold
hi GeGreen4Italic guifg=#56e156 guibg=NONE guisp=NONE gui=italic ctermfg=77 ctermbg=NONE cterm=italic
hi GeGreen4BoldItalic guifg=#56e156 guibg=NONE guisp=NONE gui=bold,italic ctermfg=77 ctermbg=NONE cterm=bold,italic
" GeBlue0
hi GeBlue0 guifg=#034d6d guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
hi GeBlue0Bold guifg=#034d6d guibg=NONE guisp=NONE gui=bold ctermfg=23 ctermbg=NONE cterm=bold
hi GeBlue0Italic guifg=#034d6d guibg=NONE guisp=NONE gui=italic ctermfg=23 ctermbg=NONE cterm=italic
hi GeBlue0BoldItalic guifg=#034d6d guibg=NONE guisp=NONE gui=bold,italic ctermfg=23 ctermbg=NONE cterm=bold,italic
" GeBlue1
hi GeBlue1 guifg=#05638c guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
hi GeBlue1Bold guifg=#05638c guibg=NONE guisp=NONE gui=bold ctermfg=24 ctermbg=NONE cterm=bold
hi GeBlue1Italic guifg=#05638c guibg=NONE guisp=NONE gui=italic ctermfg=24 ctermbg=NONE cterm=italic
hi GeBlue1BoldItalic guifg=#05638c guibg=NONE guisp=NONE gui=bold,italic ctermfg=24 ctermbg=NONE cterm=bold,italic
" GeBlue2
hi GeBlue2 guifg=#0881b5 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi GeBlue2Bold guifg=#0881b5 guibg=NONE guisp=NONE gui=bold ctermfg=31 ctermbg=NONE cterm=bold
hi GeBlue2Italic guifg=#0881b5 guibg=NONE guisp=NONE gui=italic ctermfg=31 ctermbg=NONE cterm=italic
hi GeBlue2BoldItalic guifg=#0881b5 guibg=NONE guisp=NONE gui=bold,italic ctermfg=31 ctermbg=NONE cterm=bold,italic
" GeBlue3
hi GeBlue3 guifg=#2e90bb guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi GeBlue3Bold guifg=#2e90bb guibg=NONE guisp=NONE gui=bold ctermfg=31 ctermbg=NONE cterm=bold
hi GeBlue3Italic guifg=#2e90bb guibg=NONE guisp=NONE gui=italic ctermfg=31 ctermbg=NONE cterm=italic
hi GeBlue3BoldItalic guifg=#2e90bb guibg=NONE guisp=NONE gui=bold,italic ctermfg=31 ctermbg=NONE cterm=bold,italic
" GeBlue4
hi GeBlue4 guifg=#52a4c8 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
hi GeBlue4Bold guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold ctermfg=74 ctermbg=NONE cterm=bold
hi GeBlue4Italic guifg=#52a4c8 guibg=NONE guisp=NONE gui=italic ctermfg=74 ctermbg=NONE cterm=italic
hi GeBlue4BoldItalic guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold,italic ctermfg=74 ctermbg=NONE cterm=bold,italic
" GeBrown0
hi GeBrown0 guifg=#ae5c00 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi GeBrown0Bold guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
hi GeBrown0Italic guifg=#ae5c00 guibg=NONE guisp=NONE gui=italic ctermfg=130 ctermbg=NONE cterm=italic
hi GeBrown0BoldItalic guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold,italic ctermfg=130 ctermbg=NONE cterm=bold,italic
" GeBrown1
hi GeBrown1 guifg=#de7500 guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
hi GeBrown1Bold guifg=#de7500 guibg=NONE guisp=NONE gui=bold ctermfg=172 ctermbg=NONE cterm=bold
hi GeBrown1Italic guifg=#de7500 guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=italic
hi GeBrown1BoldItalic guifg=#de7500 guibg=NONE guisp=NONE gui=bold,italic ctermfg=172 ctermbg=NONE cterm=bold,italic
" GeBrown2
hi GeBrown2 guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi GeBrown2Bold guifg=#ff8700 guibg=NONE guisp=NONE gui=bold ctermfg=208 ctermbg=NONE cterm=bold
hi GeBrown2Italic guifg=#ff8700 guibg=NONE guisp=NONE gui=italic ctermfg=208 ctermbg=NONE cterm=italic
hi GeBrown2BoldItalic guifg=#ff8700 guibg=NONE guisp=NONE gui=bold,italic ctermfg=208 ctermbg=NONE cterm=bold,italic
" GeBrown3
hi GeBrown3 guifg=#ffa035 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi GeBrown3Bold guifg=#ffa035 guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
hi GeBrown3Italic guifg=#ffa035 guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic
hi GeBrown3BoldItalic guifg=#ffa035 guibg=NONE guisp=NONE gui=bold,italic ctermfg=215 ctermbg=NONE cterm=bold,italic
" GeBrown4
hi GeBrown4 guifg=#ffb562 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi GeBrown4Bold guifg=#ffb562 guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
hi GeBrown4Italic guifg=#ffb562 guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic
hi GeBrown4BoldItalic guifg=#ffb562 guibg=NONE guisp=NONE gui=bold,italic ctermfg=215 ctermbg=NONE cterm=bold,italic
" GeRed0
hi GeRed0 guifg=#ae0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
hi GeRed0Bold guifg=#ae0000 guibg=NONE guisp=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
hi GeRed0Italic guifg=#ae0000 guibg=NONE guisp=NONE gui=italic ctermfg=124 ctermbg=NONE cterm=italic
hi GeRed0BoldItalic guifg=#ae0000 guibg=NONE guisp=NONE gui=bold,italic ctermfg=124 ctermbg=NONE cterm=bold,italic
" GeRed1
hi GeRed1 guifg=#de0000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
hi GeRed1Bold guifg=#de0000 guibg=NONE guisp=NONE gui=bold ctermfg=160 ctermbg=NONE cterm=bold
hi GeRed1Italic guifg=#de0000 guibg=NONE guisp=NONE gui=italic ctermfg=160 ctermbg=NONE cterm=italic
hi GeRed1BoldItalic guifg=#de0000 guibg=NONE guisp=NONE gui=bold,italic ctermfg=160 ctermbg=NONE cterm=bold,italic
" GeRed2
hi GeRed2 guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=9 ctermbg=NONE cterm=NONE
hi GeRed2Bold guifg=#ff0000 guibg=NONE guisp=NONE gui=bold ctermfg=9 ctermbg=NONE cterm=bold
hi GeRed2Italic guifg=#ff0000 guibg=NONE guisp=NONE gui=italic ctermfg=9 ctermbg=NONE cterm=italic
hi GeRed2BoldItalic guifg=#ff0000 guibg=NONE guisp=NONE gui=bold,italic ctermfg=9 ctermbg=NONE cterm=bold,italic
" GeRed3
hi GeRed3 guifg=#ff3535 guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi GeRed3Bold guifg=#ff3535 guibg=NONE guisp=NONE gui=bold ctermfg=203 ctermbg=NONE cterm=bold
hi GeRed3Italic guifg=#ff3535 guibg=NONE guisp=NONE gui=italic ctermfg=203 ctermbg=NONE cterm=italic
hi GeRed3BoldItalic guifg=#ff3535 guibg=NONE guisp=NONE gui=bold,italic ctermfg=203 ctermbg=NONE cterm=bold,italic
" GeRed4
hi GeRed4 guifg=#ff6262 guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi GeRed4Bold guifg=#ff6262 guibg=NONE guisp=NONE gui=bold ctermfg=203 ctermbg=NONE cterm=bold
hi GeRed4Italic guifg=#ff6262 guibg=NONE guisp=NONE gui=italic ctermfg=203 ctermbg=NONE cterm=italic
hi GeRed4BoldItalic guifg=#ff6262 guibg=NONE guisp=NONE gui=bold,italic ctermfg=203 ctermbg=NONE cterm=bold,italic

" -------------------------------------------------------------------------
" Basic UI Elements
" -------------------------------------------------------------------------
if &g:background=="light"
  " vim UI
  " general
  hi Normal guifg=#121212 guibg=#e4e4e4 guisp=NONE gui=NONE ctermfg=233 ctermbg=254 cterm=NONE
  hi LineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi Visual guifg=#121212 guibg=#52a4c8 guisp=NONE gui=NONE ctermfg=233 ctermbg=74 cterm=NONE
  " gutter + line number
  hi CursorLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=233 ctermbg=252 cterm=bold
  hi SignColumn guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterAdd guifg=#00d700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=28 ctermbg=252 cterm=bold
  hi GitGutterAddLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterDelete guifg=#de0000 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=160 ctermbg=252 cterm=bold
  hi GitGutterDeleteLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterChangeDeleteLineNr guifg=#121212 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=233 ctermbg=252 cterm=NONE
  hi GitGutterChange guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi GitGutterChangeLineNr guifg=#e4e4e4 guibg=#d0d0d0 guisp=NONE gui=NONE ctermfg=254 ctermbg=252 cterm=NONE
  hi LspErrorText guifg=#de0000 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=160 ctermbg=252 cterm=bold
  hi LspWarningText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi LspInformationText guifg=#00d700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=28 ctermbg=252 cterm=bold
  hi LspHintText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi LspCodeActionText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  " menu + split
  hi VertSplit guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi PMenu guifg=#e4e4e4 guibg=#444444 guisp=NONE gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
  hi PMenuSel guifg=#000000 guibg=#ffaf5f guisp=NONE gui=NONE ctermfg=0 ctermbg=215 cterm=NONE

else
  " background=="dark"
  " vim UI
  " general
  hi Normal guifg=#e4e4e4 guibg=#121212 guisp=NONE gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
  hi LineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi Visual guifg=#e4e4e4 guibg=#034d6d guisp=NONE gui=NONE ctermfg=254 ctermbg=23 cterm=NONE
  " gutter + line number
  hi CursorLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=bold ctermfg=254 ctermbg=235 cterm=bold
  hi SignColumn guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterAdd guifg=#56e156 guibg=#262626 guisp=NONE gui=NONE ctermfg=77 ctermbg=235 cterm=NONE
  hi GitGutterAddLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterDelete guifg=#de0000 guibg=#262626 guisp=NONE gui=bold ctermfg=160 ctermbg=235 cterm=bold
  hi GitGutterDeleteLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterChangeDeleteLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterChange guifg=#ff8700 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
  hi GitGutterChangeLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi LspErrorText guifg=#de0000 guibg=#262626 guisp=NONE gui=bold ctermfg=160 ctermbg=235 cterm=bold
  hi LspWarningText guifg=#ff8700 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
  hi LspInformationText guifg=#56e156 guibg=#262626 guisp=NONE gui=NONE ctermfg=77 ctermbg=235 cterm=NONE
  hi LspHintText guifg=#ff8700 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
  " menu + split
  hi VertSplit guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi PMenu guifg=#e4e4e4 guibg=#444444 guisp=NONE gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
  hi PMenuSel guifg=#121212 guibg=#ffaf5f guisp=NONE gui=NONE ctermfg=233 ctermbg=215 cterm=NONE
endif

" normal text stays the same, keywords are roughly normal text
" immovable things are green - constants, static fields, singletons
" local variables are blue
" instance variables, and active state is red
" functions, decorators, classes, important names are brown

" normal text
hi! link GeStatement GeBlack
hi! link GeStatementSpecial GeBlackBold

" comments are distracting, so they're gray
hi! link GeComment GeGray3Italic
hi! link GeCommentSpecial GeGray3BoldItalic

" immovable things
hi! link GeConstant GeGreen1
hi! link GeConstantSpecial GeGreen0

" state
hi! link GeField GeRed0
hi! link GeFieldItalic GeRed0Italic
hi! link GeFieldBold GeRed0Bold

" locals
hi! link GeLocalField GeBlue0
hi! link GeLocalFieldItalic GeBlue0Italic
hi! link GeLocalFieldBold GeBlue0Bold

" important things
hi! link GeFunction GeBrown0Bold
hi! link GeDecorator GeBrown0Italic
hi! link GeClass GeBrown0Bold

" -------------------------------------------------------------------------
" vim core / all apps
" -------------------------------------------------------------------------
hi! link SpecialComment GeCommentSpecial
hi! link Comment GeComment
hi! link Quote GeComment
hi! link Keyword GeGray5Bold
hi! link Function GeFunction
hi! link Structure GeFunction
hi! link Operator GeGray0Bold
hi! link Statement GeStatement
hi! link Include GeGray0Bold
hi! link Type GeGray0
hi! link Constant GeConstant
hi! link Special GeConstantSpecial
hi! link String GeConstant


" -------------------------------------------------------------------------
" vim
" -------------------------------------------------------------------------
hi! link vimCommand GeStatementSpecial
hi! link vimHiBang GeStatementSpecial
hi! link vimHiGroup GeField
hi! link vimHiTerm GeLocalField
hi! link vimGroup GeField
hi! link vimFunction GeFunction
hi! link vimUserFunc GeFunction
hi! link vueSurroundingTag GeFunction
hi! link vimOption GeField
hi! link vimEnvVar GeFieldItalic
hi! link vimHiAttrib GeConstant


" -------------------------------------------------------------------------
" gray \#cccccc
" -------------------------------------------------------------------------
hi! link dtDelim Quote

hi! link gitcommitUntrackedFile GeGray4Bold
hi! link gitcommitSummary GeGray6

hi! link groovyDocTags SpecialComment
hi! link groovyJDKBuiltin GeGray4Bold

hi! link htmlTagName GeGray6Bold
hi! link htmlTag GeGray6Bold
hi! link htmlEndTag GeGray6Bold

hi! link javaAnnotation GeGray2
hi! link javaDocTags GeGray2

hi! link javaScriptGlobal GeGray5
hi! link javaScriptIdentifier GeGray2
hi! link javaScriptFunction GeGray2
hi! link javaScriptLabel GeGray2

hi! link jsonBraces GeGray2
hi! link jsonNoise GeGray0

" nerdtree
hi! link NERDTreeNodeDelimiters GeGray2
hi! link NERDTreeLinkTarget Comment

hi! link pythonBuiltin GeGray4Bold

hi! link shArithmetic GeGray5
hi! link shCommandSub GeGray2

hi! link typescriptLabel GeGray2
hi! link typescriptStorageClass GeGray2
hi! link typescriptGlobalObjects GeGray2
hi! link typescriptLogicSymbols GeGray4Bold
hi! link typescriptBraces GeGray4Bold

hi! link NonText GeGray0

hi! link yamlFlowIndicator GeGray6Bold

hi! link xmlTag GeGray6Bold
hi! link xmlTagName GeGray6Bold
hi! link xmlEndTag GeGray6Bold
hi! link xmlNamespace GeGray2
hi! link xmlAttribPunct GeGray0

" -------------------------------------------------------------------------
" green \#2dda2d
" -------------------------------------------------------------------------
hi! link typescriptDecorator YellowShade0Bold

hi! link cssAttrRegion GeGreen0
hi! link cssAttr GeGreen0

hi! link diffAdded GeGreen0

hi! link gitHash Constant

hi! link javaScriptValue GeGreen0
hi! link javaScriptNull GreenShade0Italic

hi! link jsonNull GreenShade0Italic

" nerdtree
hi! link NERDTreeExecFile GeGreen0

" -------------------------------------------------------------------------
" blue \#2e90bb
" -------------------------------------------------------------------------
hi! link Identifier GeBlue0
hi! link Label GeBlue0

hi! link cssProp GeBlue0Bold
hi! link cssDefinition GeBlue0Bold
hi! link cssStyle GeBlue0Bold

hi! link dtGroup Title
hi! link dtLocaleKey Label
hi! link dtExecKey Label
hi! link dtTypeKey Label
hi! link dtStringKey Label
hi! link dtNumericKey Label
hi! link dtBooleanKey Label

"ini
hi! link dosiniHeader Title
hi! link dosiniLabel Label

hi! link gitKeyword Label

hi! link jsonKeyword GeBlue0

hi! link htmlArg GeBlue0

" nerdtree
hi! link Directory GeBlue0Bold
hi! link NERDTreeDir Directory
hi! link NERDTreeNodeDelimiters Directory
hi! link NERDTreeLinkFile BlueShade3

hi! link yamlBlockMappingKey GeBlue0
hi! link yamlKeyValueDelimiter GeBlue0

hi! link xmlAttrib GeBlue0

" -------------------------------------------------------------------------
" yellow  \#ffa035
" -------------------------------------------------------------------------

hi! link PreProc GeBrown0
hi! link Tag GeBrown0Bold
hi! link Title GeBrown0Bold

hi! link gitcommitHeader YellowShade0Bold
hi! link gitcommitSelectedType YellowShade0
hi! link gitcommitType YellowShade0

hi! link htmlSpecialTagName YellowShade0

hi! link javaScopeDecl YellowShade0
hi! link javaType YellowShade0
hi! link javaClassDecl YellowShade0
hi! link javaStorageClass YellowShade0
hi! link javaLabel YellowShade0

hi! link pbRPC YellowShade0Bold

hi! link pythonFunction GeBrown0Bold
hi! link pythonDecorator GeBrown0Italic
hi! link pythonDecoratorName GeBrown0Italic

hi! link shFunction YellowShade0Bold

hi! link typescriptDecorators YellowShade0Italic

" vim source, NonText are blocks of different source code
" -------------------------------------------------------------------------
" red \#ff3535
" -------------------------------------------------------------------------

hi! link Todo RedShade2

hi! link cssVendor RedShade1

hi! link diffRemoved RedShade1

hi! link gitcommitBranch RedShade1

hi! link javaScriptMember RedShade1

let g:colors_name = "gespace"

