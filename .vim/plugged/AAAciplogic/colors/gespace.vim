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

  hi GrayShade0 guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
  hi GrayShade1 guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
  hi GrayShade2 guifg=#d0d0d0 guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
  hi GrayShade3 guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
  hi GrayShade3Italic guifg=#6c6c6c guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=italic
  hi GrayShade4 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi GrayShade4Bold guifg=#444444 guibg=NONE guisp=NONE gui=bold ctermfg=238 ctermbg=NONE cterm=bold
  hi GrayShade4Italic guifg=#444444 guibg=NONE guisp=NONE gui=italic ctermfg=238 ctermbg=NONE cterm=italic
  hi GrayShade5 guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
  hi GrayShade6 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi GrayShade7 guifg=#262626 guibg=NONE guisp=NONE gui=NONE ctermfg=235 ctermbg=NONE cterm=NONE
  hi GrayShade7Bold guifg=#262626 guibg=NONE guisp=NONE gui=bold ctermfg=235 ctermbg=NONE cterm=bold
  hi GrayShade8 guifg=#000000 guibg=NONE guisp=NONE gui=NONE ctermfg=0 ctermbg=NONE cterm=NONE
  hi GrayShade8Bold guifg=#000000 guibg=NONE guisp=NONE gui=bold ctermfg=0 ctermbg=NONE cterm=bold

  hi GreenShade0 guifg=#00d700 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
  hi GreenShade0Italic guifg=#00d700 guibg=NONE guisp=NONE gui=italic ctermfg=28 ctermbg=NONE cterm=italic
  hi GreenShade1 guifg=#00b100 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
  hi GreenShade1Bold guifg=#00b100 guibg=NONE guisp=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
  hi GreenShade2 guifg=#56e156 guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE

  hi BlueShade0 guifg=#034d6d guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
  hi BlueShade0Bold guifg=#034d6d guibg=NONE guisp=NONE gui=bold ctermfg=23 ctermbg=NONE cterm=bold
  hi BlueShade1 guifg=#05638c guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
  hi BlueShade1Bold guifg=#05638c guibg=NONE guisp=NONE gui=bold ctermfg=24 ctermbg=NONE cterm=bold
  hi BlueShade2 guifg=#52a4c8 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi BlueShade3 guifg=#0881b5 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
  hi BlueShade3Bold guifg=#0881b5 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=bold

  hi YellowShade0 guifg=#ae5c00 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi YellowShade0Bold guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  hi YellowShade0Italic guifg=#ae5c00 guibg=NONE guisp=NONE gui=italic ctermfg=130 ctermbg=NONE cterm=italic

  hi RedShade0 guifg=#ae0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
  hi RedShade1 guifg=#de0000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
  hi RedShade1Italic guifg=#de0000 guibg=NONE guisp=NONE gui=italic ctermfg=160 ctermbg=NONE cterm=italic
  hi RedShade2 guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
  hi RedShade3 guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=9 ctermbg=NONE cterm=NONE

else
  " vim UI
  " general
  hi Normal guifg=#e4e4e4 guibg=#121212 guisp=NONE gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
  hi LineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi Visual guifg=#e4e4e4 guibg=#034d6d guisp=NONE gui=NONE ctermfg=254 ctermbg=23 cterm=NONE
  " gutter + line number
  hi CursorLineNr guifg=#ffffff guibg=#262626 guisp=NONE gui=bold ctermfg=15 ctermbg=235 cterm=bold
  hi SignColumn guifg=#ffffff guibg=#262626 guisp=NONE gui=NONE ctermfg=15 ctermbg=235 cterm=NONE
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
  hi PMenuSel guifg=#000000 guibg=#ffaf5f guisp=NONE gui=NONE ctermfg=0 ctermbg=215 cterm=NONE

  hi GrayShade0 guifg=#000000 guibg=NONE guisp=NONE gui=NONE ctermfg=0 ctermbg=NONE cterm=NONE
  hi GrayShade1 guifg=#262626 guibg=NONE guisp=NONE gui=NONE ctermfg=235 ctermbg=NONE cterm=NONE
  hi GrayShade2 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi GrayShade3 guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
  hi GrayShade3Italic guifg=#6c6c6c guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=italic
  hi GrayShade4 guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi GrayShade4Bold guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold
  hi GrayShade4Italic guifg=#a8a8a8 guibg=NONE guisp=NONE gui=italic ctermfg=248 ctermbg=NONE cterm=italic
  hi GrayShade5 guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE ctermfg=250 ctermbg=NONE cterm=NONE
  hi GrayShade6 guifg=#d0d0d0 guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
  hi GrayShade7 guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
  hi GrayShade7Bold guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold
  hi GrayShade8 guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
  hi GrayShade8Bold guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold

  hi GreenShade0 guifg=#56e156 guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
  hi GreenShade0Italic guifg=#56e156 guibg=NONE guisp=NONE gui=italic ctermfg=77 ctermbg=NONE cterm=italic
  hi GreenShade1 guifg=#00b100 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
  hi GreenShade1Bold guifg=#00b100 guibg=NONE guisp=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
  hi GreenShade2 guifg=#00d700 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE

  hi BlueShade0 guifg=#0881b5 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
  hi BlueShade0Bold guifg=#0881b5 guibg=NONE guisp=NONE gui=bold ctermfg=31 ctermbg=NONE cterm=bold
  hi BlueShade1 guifg=#52a4c8 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi BlueShade1Bold guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold ctermfg=74 ctermbg=NONE cterm=bold
  hi BlueShade2 guifg=#05638c guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
  hi BlueShade3 guifg=#034d6d guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
  hi BlueShade3Bold guifg=#034d6d guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=bold

  hi YellowShade0 guifg=#ffb562 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi YellowShade0Bold guifg=#ffb562 guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
  hi YellowShade0Italic guifg=#ffb562 guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic

  hi RedShade0 guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=9 ctermbg=NONE cterm=NONE
  hi RedShade1 guifg=#ff6262 guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
  hi RedShade1Italic guifg=#ff6262 guibg=NONE guisp=NONE gui=italic ctermfg=203 ctermbg=NONE cterm=italic
  hi RedShade2 guifg=#de0000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
  hi RedShade3 guifg=#ae0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
endif

" -------------------------------------------------------------------------
" gray \#cccccc
" -------------------------------------------------------------------------
hi! link SpecialComment GrayShade4Italic
hi! link Comment GrayShade3Italic
hi! link Quote GrayShade3
hi! link Keyword GrayShade7Bold

hi! link Quote GrayShade3
hi! link Function GrayShade7Bold
hi! link Structure GrayShade7Bold
hi! link Operator GrayShade4Bold

hi! link Statement GrayShade4Bold
hi! link Include GrayShade4Bold
hi! link Type GrayShade4

hi! link dtDelim Quote

hi! link gitcommitUntrackedFile GrayShade4Bold
hi! link gitcommitSummary GrayShade8

hi! link groovyDocTags SpecialComment
hi! link groovyJDKBuiltin GrayShade4Bold

hi! link htmlTagName GrayShade8Bold
hi! link htmlTag GrayShade8Bold
hi! link htmlEndTag GrayShade8Bold

hi! link javaAnnotation GrayShade4
hi! link javaDocTags GrayShade4

hi! link javaScriptGlobal GrayShade7
hi! link javaScriptIdentifier GrayShade4
hi! link javaScriptFunction GrayShade4
hi! link javaScriptLabel GrayShade4

hi! link jsonBraces GrayShade4
hi! link jsonNoise GrayShade2

" nerdtree
hi! link NERDTreeNodeDelimiters GrayShade4
hi! link NERDTreeLinkTarget Comment

hi! link pythonBuiltin GrayShade4Bold

hi! link shArithmetic GrayShade7
hi! link shCommandSub GrayShade4

hi! link typescriptLabel GrayShade4
hi! link typescriptStorageClass GrayShade4
hi! link typescriptGlobalObjects GrayShade4
hi! link typescriptLogicSymbols GrayShade4Bold
hi! link typescriptBraces GrayShade4Bold

hi! link vimGroup GrayShade4
hi! link vimGroupName GrayShade4
hi! link NonText GrayShade2

hi! link yamlFlowIndicator GrayShade8Bold

hi! link xmlTag GrayShade8Bold
hi! link xmlTagName GrayShade8Bold
hi! link xmlEndTag GrayShade8Bold
hi! link xmlNamespace GrayShade4
hi! link xmlAttribPunct GrayShade2

" -------------------------------------------------------------------------
" green \#2dda2d
" -------------------------------------------------------------------------
hi! link Constant GreenShade0
hi! link typescriptDecorator YellowShade0Bold
hi! link Special GreenShade1Bold

hi! link cssAttrRegion GreenShade0
hi! link cssAttr GreenShade0

hi! link diffAdded GreenShade0

hi! link gitHash Constant

hi! link javaScriptValue GreenShade0
hi! link javaScriptNull GreenShade0Italic

hi! link jsonNull GreenShade0Italic

" nerdtree
hi! link NERDTreeExecFile GreenShade0

hi! link vimHiAttrib GreenShade0

" -------------------------------------------------------------------------
" blue \#2e90bb
" -------------------------------------------------------------------------
hi! link Identifier BlueShade1
hi! link Label BlueShade1

hi! link cssProp BlueShade1Bold
hi! link cssDefinition BlueShade1Bold
hi! link cssStyle BlueShade1Bold

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

hi! link jsonKeyword BlueShade1

hi! link htmlArg BlueShade1

" nerdtree
hi! link Directory BlueShade1Bold
hi! link NERDTreeDir Directory
hi! link NERDTreeNodeDelimiters Directory
hi! link NERDTreeLinkFile BlueShade3

hi! link vimSynOption BlueShade1
hi! link vimHiTerm BlueShade1

hi! link yamlBlockMappingKey BlueShade1
hi! link yamlKeyValueDelimiter BlueShade1

hi! link xmlAttrib BlueShade1

" -------------------------------------------------------------------------
" yellow  \#ffa035
" -------------------------------------------------------------------------

hi! link PreProc YellowShade0
hi! link Tag YellowShade0Bold
hi! link Title YellowShade0Bold

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

hi! link pythonFunction YellowShade0Bold
hi! link pythonDecorator YellowShade0Italic
hi! link pythonDecoratorName YellowShade0Italic

hi! link shFunction YellowShade0Bold

hi! link typescriptDecorators YellowShade0Italic

" vim source, NonText are blocks of different source code
hi! link vimFunction YellowShade0
hi! link vimUserFunc YellowShade0

hi! link vueSurroundingTag YellowShade0

" -------------------------------------------------------------------------
" red \#ff3535
" -------------------------------------------------------------------------

hi! link Todo RedShade2

hi! link cssVendor RedShade1

hi! link diffRemoved RedShade1

hi! link gitcommitBranch RedShade1

hi! link javaScriptMember RedShade1

hi! link vimOption RedShade1
hi! link vimEnvVar RedShade1Italic

let g:colors_name = "gespace"

