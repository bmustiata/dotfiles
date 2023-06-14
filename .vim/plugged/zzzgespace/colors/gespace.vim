if exists("syntax_on")
    syntax reset
endif

set t_Co=256

" we favor the true color scheme
if (has("termguicolors"))
    set termguicolors
endif

if !exists("s:gespace_initialized")
    let s:gespace_initialized = 1

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
endif

let g:colors_name = "gespace"

" ------------------------------------------- DO NOT EDIT AFTER LINE ------
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_00_palette.vim
" -------------------------------------------------------------------------
" The GeSpace Palette
" -------------------------------------------------------------------------

" GeWhite
hi GeWhite guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi GeWhiteBold guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold
hi GeWhiteItalic guifg=#e4e4e4 guibg=NONE guisp=NONE gui=italic ctermfg=254 ctermbg=NONE cterm=italic
hi GeWhiteUnderline guifg=#e4e4e4 guibg=NONE guisp=NONE gui=underline ctermfg=254 ctermbg=NONE cterm=underline
hi GeWhiteBoldUnderline guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold,underline ctermfg=254 ctermbg=NONE cterm=bold,underline
hi GeWhiteItalicUnderline guifg=#e4e4e4 guibg=NONE guisp=NONE gui=italic,underline ctermfg=254 ctermbg=NONE cterm=italic,underline
hi GeWhiteBoldItalic guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold,italic ctermfg=254 ctermbg=NONE cterm=bold,italic
hi GeWhiteBoldItalicUnderline guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=254 ctermbg=NONE cterm=bold,italic,underline
" GeBlack
hi GeBlack guifg=#121212 guibg=NONE guisp=NONE gui=NONE ctermfg=233 ctermbg=NONE cterm=NONE
hi GeBlackBold guifg=#121212 guibg=NONE guisp=NONE gui=bold ctermfg=233 ctermbg=NONE cterm=bold
hi GeBlackItalic guifg=#121212 guibg=NONE guisp=NONE gui=italic ctermfg=233 ctermbg=NONE cterm=italic
hi GeBlackUnderline guifg=#121212 guibg=NONE guisp=NONE gui=underline ctermfg=233 ctermbg=NONE cterm=underline
hi GeBlackBoldUnderline guifg=#121212 guibg=NONE guisp=NONE gui=bold,underline ctermfg=233 ctermbg=NONE cterm=bold,underline
hi GeBlackItalicUnderline guifg=#121212 guibg=NONE guisp=NONE gui=italic,underline ctermfg=233 ctermbg=NONE cterm=italic,underline
hi GeBlackBoldItalic guifg=#121212 guibg=NONE guisp=NONE gui=bold,italic ctermfg=233 ctermbg=NONE cterm=bold,italic
hi GeBlackBoldItalicUnderline guifg=#121212 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=233 ctermbg=NONE cterm=bold,italic,underline
" GeGray0
hi GeGray0 guifg=#262626 guibg=NONE guisp=NONE gui=NONE ctermfg=235 ctermbg=NONE cterm=NONE
hi GeGray0Bold guifg=#262626 guibg=NONE guisp=NONE gui=bold ctermfg=235 ctermbg=NONE cterm=bold
hi GeGray0Italic guifg=#262626 guibg=NONE guisp=NONE gui=italic ctermfg=235 ctermbg=NONE cterm=italic
hi GeGray0Underline guifg=#262626 guibg=NONE guisp=NONE gui=underline ctermfg=235 ctermbg=NONE cterm=underline
hi GeGray0BoldUnderline guifg=#262626 guibg=NONE guisp=NONE gui=bold,underline ctermfg=235 ctermbg=NONE cterm=bold,underline
hi GeGray0ItalicUnderline guifg=#262626 guibg=NONE guisp=NONE gui=italic,underline ctermfg=235 ctermbg=NONE cterm=italic,underline
hi GeGray0BoldItalic guifg=#262626 guibg=NONE guisp=NONE gui=bold,italic ctermfg=235 ctermbg=NONE cterm=bold,italic
hi GeGray0BoldItalicUnderline guifg=#262626 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=235 ctermbg=NONE cterm=bold,italic,underline
" GeGray1
hi GeGray1 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
hi GeGray1Bold guifg=#444444 guibg=NONE guisp=NONE gui=bold ctermfg=238 ctermbg=NONE cterm=bold
hi GeGray1Italic guifg=#444444 guibg=NONE guisp=NONE gui=italic ctermfg=238 ctermbg=NONE cterm=italic
hi GeGray1Underline guifg=#444444 guibg=NONE guisp=NONE gui=underline ctermfg=238 ctermbg=NONE cterm=underline
hi GeGray1BoldUnderline guifg=#444444 guibg=NONE guisp=NONE gui=bold,underline ctermfg=238 ctermbg=NONE cterm=bold,underline
hi GeGray1ItalicUnderline guifg=#444444 guibg=NONE guisp=NONE gui=italic,underline ctermfg=238 ctermbg=NONE cterm=italic,underline
hi GeGray1BoldItalic guifg=#444444 guibg=NONE guisp=NONE gui=bold,italic ctermfg=238 ctermbg=NONE cterm=bold,italic
hi GeGray1BoldItalicUnderline guifg=#444444 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=238 ctermbg=NONE cterm=bold,italic,underline
" GeGray2
hi GeGray2 guifg=#585858 guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
hi GeGray2Bold guifg=#585858 guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
hi GeGray2Italic guifg=#585858 guibg=NONE guisp=NONE gui=italic ctermfg=240 ctermbg=NONE cterm=italic
hi GeGray2Underline guifg=#585858 guibg=NONE guisp=NONE gui=underline ctermfg=240 ctermbg=NONE cterm=underline
hi GeGray2BoldUnderline guifg=#585858 guibg=NONE guisp=NONE gui=bold,underline ctermfg=240 ctermbg=NONE cterm=bold,underline
hi GeGray2ItalicUnderline guifg=#585858 guibg=NONE guisp=NONE gui=italic,underline ctermfg=240 ctermbg=NONE cterm=italic,underline
hi GeGray2BoldItalic guifg=#585858 guibg=NONE guisp=NONE gui=bold,italic ctermfg=240 ctermbg=NONE cterm=bold,italic
hi GeGray2BoldItalicUnderline guifg=#585858 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=240 ctermbg=NONE cterm=bold,italic,underline
" GeGray3
hi GeGray3 guifg=#949494 guibg=NONE guisp=NONE gui=NONE ctermfg=246 ctermbg=NONE cterm=NONE
hi GeGray3Bold guifg=#949494 guibg=NONE guisp=NONE gui=bold ctermfg=246 ctermbg=NONE cterm=bold
hi GeGray3Italic guifg=#949494 guibg=NONE guisp=NONE gui=italic ctermfg=246 ctermbg=NONE cterm=italic
hi GeGray3Underline guifg=#949494 guibg=NONE guisp=NONE gui=underline ctermfg=246 ctermbg=NONE cterm=underline
hi GeGray3BoldUnderline guifg=#949494 guibg=NONE guisp=NONE gui=bold,underline ctermfg=246 ctermbg=NONE cterm=bold,underline
hi GeGray3ItalicUnderline guifg=#949494 guibg=NONE guisp=NONE gui=italic,underline ctermfg=246 ctermbg=NONE cterm=italic,underline
hi GeGray3BoldItalic guifg=#949494 guibg=NONE guisp=NONE gui=bold,italic ctermfg=246 ctermbg=NONE cterm=bold,italic
hi GeGray3BoldItalicUnderline guifg=#949494 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=246 ctermbg=NONE cterm=bold,italic,underline
" GeGray4
hi GeGray4 guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE ctermfg=250 ctermbg=NONE cterm=NONE
hi GeGray4Bold guifg=#bcbcbc guibg=NONE guisp=NONE gui=bold ctermfg=250 ctermbg=NONE cterm=bold
hi GeGray4Italic guifg=#bcbcbc guibg=NONE guisp=NONE gui=italic ctermfg=250 ctermbg=NONE cterm=italic
hi GeGray4Underline guifg=#bcbcbc guibg=NONE guisp=NONE gui=underline ctermfg=250 ctermbg=NONE cterm=underline
hi GeGray4BoldUnderline guifg=#bcbcbc guibg=NONE guisp=NONE gui=bold,underline ctermfg=250 ctermbg=NONE cterm=bold,underline
hi GeGray4ItalicUnderline guifg=#bcbcbc guibg=NONE guisp=NONE gui=italic,underline ctermfg=250 ctermbg=NONE cterm=italic,underline
hi GeGray4BoldItalic guifg=#bcbcbc guibg=NONE guisp=NONE gui=bold,italic ctermfg=250 ctermbg=NONE cterm=bold,italic
hi GeGray4BoldItalicUnderline guifg=#bcbcbc guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=250 ctermbg=NONE cterm=bold,italic,underline
" GeGray5
hi GeGray5 guifg=#d0d0d0 guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi GeGray5Bold guifg=#d0d0d0 guibg=NONE guisp=NONE gui=bold ctermfg=252 ctermbg=NONE cterm=bold
hi GeGray5Italic guifg=#d0d0d0 guibg=NONE guisp=NONE gui=italic ctermfg=252 ctermbg=NONE cterm=italic
hi GeGray5Underline guifg=#d0d0d0 guibg=NONE guisp=NONE gui=underline ctermfg=252 ctermbg=NONE cterm=underline
hi GeGray5BoldUnderline guifg=#d0d0d0 guibg=NONE guisp=NONE gui=bold,underline ctermfg=252 ctermbg=NONE cterm=bold,underline
hi GeGray5ItalicUnderline guifg=#d0d0d0 guibg=NONE guisp=NONE gui=italic,underline ctermfg=252 ctermbg=NONE cterm=italic,underline
hi GeGray5BoldItalic guifg=#d0d0d0 guibg=NONE guisp=NONE gui=bold,italic ctermfg=252 ctermbg=NONE cterm=bold,italic
hi GeGray5BoldItalicUnderline guifg=#d0d0d0 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=252 ctermbg=NONE cterm=bold,italic,underline
" GeGreen0
hi GeGreen0 guifg=#008b00 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi GeGreen0Bold guifg=#008b00 guibg=NONE guisp=NONE gui=bold ctermfg=28 ctermbg=NONE cterm=bold
hi GeGreen0Italic guifg=#008b00 guibg=NONE guisp=NONE gui=italic ctermfg=28 ctermbg=NONE cterm=italic
hi GeGreen0Underline guifg=#008b00 guibg=NONE guisp=NONE gui=underline ctermfg=28 ctermbg=NONE cterm=underline
hi GeGreen0BoldUnderline guifg=#008b00 guibg=NONE guisp=NONE gui=bold,underline ctermfg=28 ctermbg=NONE cterm=bold,underline
hi GeGreen0ItalicUnderline guifg=#008b00 guibg=NONE guisp=NONE gui=italic,underline ctermfg=28 ctermbg=NONE cterm=italic,underline
hi GeGreen0BoldItalic guifg=#008b00 guibg=NONE guisp=NONE gui=bold,italic ctermfg=28 ctermbg=NONE cterm=bold,italic
hi GeGreen0BoldItalicUnderline guifg=#008b00 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=28 ctermbg=NONE cterm=bold,italic,underline
" GeGreen1
hi GeGreen1 guifg=#00b100 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi GeGreen1Bold guifg=#00b100 guibg=NONE guisp=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi GeGreen1Italic guifg=#00b100 guibg=NONE guisp=NONE gui=italic ctermfg=34 ctermbg=NONE cterm=italic
hi GeGreen1Underline guifg=#00b100 guibg=NONE guisp=NONE gui=underline ctermfg=34 ctermbg=NONE cterm=underline
hi GeGreen1BoldUnderline guifg=#00b100 guibg=NONE guisp=NONE gui=bold,underline ctermfg=34 ctermbg=NONE cterm=bold,underline
hi GeGreen1ItalicUnderline guifg=#00b100 guibg=NONE guisp=NONE gui=italic,underline ctermfg=34 ctermbg=NONE cterm=italic,underline
hi GeGreen1BoldItalic guifg=#00b100 guibg=NONE guisp=NONE gui=bold,italic ctermfg=34 ctermbg=NONE cterm=bold,italic
hi GeGreen1BoldItalicUnderline guifg=#00b100 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=34 ctermbg=NONE cterm=bold,italic,underline
" GeGreen2
hi GeGreen2 guifg=#00d700 guibg=NONE guisp=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi GeGreen2Bold guifg=#00d700 guibg=NONE guisp=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi GeGreen2Italic guifg=#00d700 guibg=NONE guisp=NONE gui=italic ctermfg=40 ctermbg=NONE cterm=italic
hi GeGreen2Underline guifg=#00d700 guibg=NONE guisp=NONE gui=underline ctermfg=40 ctermbg=NONE cterm=underline
hi GeGreen2BoldUnderline guifg=#00d700 guibg=NONE guisp=NONE gui=bold,underline ctermfg=40 ctermbg=NONE cterm=bold,underline
hi GeGreen2ItalicUnderline guifg=#00d700 guibg=NONE guisp=NONE gui=italic,underline ctermfg=40 ctermbg=NONE cterm=italic,underline
hi GeGreen2BoldItalic guifg=#00d700 guibg=NONE guisp=NONE gui=bold,italic ctermfg=40 ctermbg=NONE cterm=bold,italic
hi GeGreen2BoldItalicUnderline guifg=#00d700 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=40 ctermbg=NONE cterm=bold,italic,underline
" GeGreen3
hi GeGreen3 guifg=#2dda2d guibg=NONE guisp=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi GeGreen3Bold guifg=#2dda2d guibg=NONE guisp=NONE gui=bold ctermfg=40 ctermbg=NONE cterm=bold
hi GeGreen3Italic guifg=#2dda2d guibg=NONE guisp=NONE gui=italic ctermfg=40 ctermbg=NONE cterm=italic
hi GeGreen3Underline guifg=#2dda2d guibg=NONE guisp=NONE gui=underline ctermfg=40 ctermbg=NONE cterm=underline
hi GeGreen3BoldUnderline guifg=#2dda2d guibg=NONE guisp=NONE gui=bold,underline ctermfg=40 ctermbg=NONE cterm=bold,underline
hi GeGreen3ItalicUnderline guifg=#2dda2d guibg=NONE guisp=NONE gui=italic,underline ctermfg=40 ctermbg=NONE cterm=italic,underline
hi GeGreen3BoldItalic guifg=#2dda2d guibg=NONE guisp=NONE gui=bold,italic ctermfg=40 ctermbg=NONE cterm=bold,italic
hi GeGreen3BoldItalicUnderline guifg=#2dda2d guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=40 ctermbg=NONE cterm=bold,italic,underline
" GeGreen4
hi GeGreen4 guifg=#56e156 guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
hi GeGreen4Bold guifg=#56e156 guibg=NONE guisp=NONE gui=bold ctermfg=77 ctermbg=NONE cterm=bold
hi GeGreen4Italic guifg=#56e156 guibg=NONE guisp=NONE gui=italic ctermfg=77 ctermbg=NONE cterm=italic
hi GeGreen4Underline guifg=#56e156 guibg=NONE guisp=NONE gui=underline ctermfg=77 ctermbg=NONE cterm=underline
hi GeGreen4BoldUnderline guifg=#56e156 guibg=NONE guisp=NONE gui=bold,underline ctermfg=77 ctermbg=NONE cterm=bold,underline
hi GeGreen4ItalicUnderline guifg=#56e156 guibg=NONE guisp=NONE gui=italic,underline ctermfg=77 ctermbg=NONE cterm=italic,underline
hi GeGreen4BoldItalic guifg=#56e156 guibg=NONE guisp=NONE gui=bold,italic ctermfg=77 ctermbg=NONE cterm=bold,italic
hi GeGreen4BoldItalicUnderline guifg=#56e156 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=77 ctermbg=NONE cterm=bold,italic,underline
" GeBlue0
hi GeBlue0 guifg=#034d6d guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
hi GeBlue0Bold guifg=#034d6d guibg=NONE guisp=NONE gui=bold ctermfg=23 ctermbg=NONE cterm=bold
hi GeBlue0Italic guifg=#034d6d guibg=NONE guisp=NONE gui=italic ctermfg=23 ctermbg=NONE cterm=italic
hi GeBlue0Underline guifg=#034d6d guibg=NONE guisp=NONE gui=underline ctermfg=23 ctermbg=NONE cterm=underline
hi GeBlue0BoldUnderline guifg=#034d6d guibg=NONE guisp=NONE gui=bold,underline ctermfg=23 ctermbg=NONE cterm=bold,underline
hi GeBlue0ItalicUnderline guifg=#034d6d guibg=NONE guisp=NONE gui=italic,underline ctermfg=23 ctermbg=NONE cterm=italic,underline
hi GeBlue0BoldItalic guifg=#034d6d guibg=NONE guisp=NONE gui=bold,italic ctermfg=23 ctermbg=NONE cterm=bold,italic
hi GeBlue0BoldItalicUnderline guifg=#034d6d guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=23 ctermbg=NONE cterm=bold,italic,underline
" GeBlue1
hi GeBlue1 guifg=#05638c guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
hi GeBlue1Bold guifg=#05638c guibg=NONE guisp=NONE gui=bold ctermfg=24 ctermbg=NONE cterm=bold
hi GeBlue1Italic guifg=#05638c guibg=NONE guisp=NONE gui=italic ctermfg=24 ctermbg=NONE cterm=italic
hi GeBlue1Underline guifg=#05638c guibg=NONE guisp=NONE gui=underline ctermfg=24 ctermbg=NONE cterm=underline
hi GeBlue1BoldUnderline guifg=#05638c guibg=NONE guisp=NONE gui=bold,underline ctermfg=24 ctermbg=NONE cterm=bold,underline
hi GeBlue1ItalicUnderline guifg=#05638c guibg=NONE guisp=NONE gui=italic,underline ctermfg=24 ctermbg=NONE cterm=italic,underline
hi GeBlue1BoldItalic guifg=#05638c guibg=NONE guisp=NONE gui=bold,italic ctermfg=24 ctermbg=NONE cterm=bold,italic
hi GeBlue1BoldItalicUnderline guifg=#05638c guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=24 ctermbg=NONE cterm=bold,italic,underline
" GeBlue2
hi GeBlue2 guifg=#0881b5 guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi GeBlue2Bold guifg=#0881b5 guibg=NONE guisp=NONE gui=bold ctermfg=31 ctermbg=NONE cterm=bold
hi GeBlue2Italic guifg=#0881b5 guibg=NONE guisp=NONE gui=italic ctermfg=31 ctermbg=NONE cterm=italic
hi GeBlue2Underline guifg=#0881b5 guibg=NONE guisp=NONE gui=underline ctermfg=31 ctermbg=NONE cterm=underline
hi GeBlue2BoldUnderline guifg=#0881b5 guibg=NONE guisp=NONE gui=bold,underline ctermfg=31 ctermbg=NONE cterm=bold,underline
hi GeBlue2ItalicUnderline guifg=#0881b5 guibg=NONE guisp=NONE gui=italic,underline ctermfg=31 ctermbg=NONE cterm=italic,underline
hi GeBlue2BoldItalic guifg=#0881b5 guibg=NONE guisp=NONE gui=bold,italic ctermfg=31 ctermbg=NONE cterm=bold,italic
hi GeBlue2BoldItalicUnderline guifg=#0881b5 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=31 ctermbg=NONE cterm=bold,italic,underline
" GeBlue3
hi GeBlue3 guifg=#2e90bb guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi GeBlue3Bold guifg=#2e90bb guibg=NONE guisp=NONE gui=bold ctermfg=31 ctermbg=NONE cterm=bold
hi GeBlue3Italic guifg=#2e90bb guibg=NONE guisp=NONE gui=italic ctermfg=31 ctermbg=NONE cterm=italic
hi GeBlue3Underline guifg=#2e90bb guibg=NONE guisp=NONE gui=underline ctermfg=31 ctermbg=NONE cterm=underline
hi GeBlue3BoldUnderline guifg=#2e90bb guibg=NONE guisp=NONE gui=bold,underline ctermfg=31 ctermbg=NONE cterm=bold,underline
hi GeBlue3ItalicUnderline guifg=#2e90bb guibg=NONE guisp=NONE gui=italic,underline ctermfg=31 ctermbg=NONE cterm=italic,underline
hi GeBlue3BoldItalic guifg=#2e90bb guibg=NONE guisp=NONE gui=bold,italic ctermfg=31 ctermbg=NONE cterm=bold,italic
hi GeBlue3BoldItalicUnderline guifg=#2e90bb guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=31 ctermbg=NONE cterm=bold,italic,underline
" GeBlue4
hi GeBlue4 guifg=#52a4c8 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
hi GeBlue4Bold guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold ctermfg=74 ctermbg=NONE cterm=bold
hi GeBlue4Italic guifg=#52a4c8 guibg=NONE guisp=NONE gui=italic ctermfg=74 ctermbg=NONE cterm=italic
hi GeBlue4Underline guifg=#52a4c8 guibg=NONE guisp=NONE gui=underline ctermfg=74 ctermbg=NONE cterm=underline
hi GeBlue4BoldUnderline guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold,underline ctermfg=74 ctermbg=NONE cterm=bold,underline
hi GeBlue4ItalicUnderline guifg=#52a4c8 guibg=NONE guisp=NONE gui=italic,underline ctermfg=74 ctermbg=NONE cterm=italic,underline
hi GeBlue4BoldItalic guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold,italic ctermfg=74 ctermbg=NONE cterm=bold,italic
hi GeBlue4BoldItalicUnderline guifg=#52a4c8 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=74 ctermbg=NONE cterm=bold,italic,underline
" GeBrown0
hi GeBrown0 guifg=#ae5c00 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi GeBrown0Bold guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
hi GeBrown0Italic guifg=#ae5c00 guibg=NONE guisp=NONE gui=italic ctermfg=130 ctermbg=NONE cterm=italic
hi GeBrown0Underline guifg=#ae5c00 guibg=NONE guisp=NONE gui=underline ctermfg=130 ctermbg=NONE cterm=underline
hi GeBrown0BoldUnderline guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold,underline ctermfg=130 ctermbg=NONE cterm=bold,underline
hi GeBrown0ItalicUnderline guifg=#ae5c00 guibg=NONE guisp=NONE gui=italic,underline ctermfg=130 ctermbg=NONE cterm=italic,underline
hi GeBrown0BoldItalic guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold,italic ctermfg=130 ctermbg=NONE cterm=bold,italic
hi GeBrown0BoldItalicUnderline guifg=#ae5c00 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=130 ctermbg=NONE cterm=bold,italic,underline
" GeBrown1
hi GeBrown1 guifg=#de7500 guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
hi GeBrown1Bold guifg=#de7500 guibg=NONE guisp=NONE gui=bold ctermfg=172 ctermbg=NONE cterm=bold
hi GeBrown1Italic guifg=#de7500 guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=italic
hi GeBrown1Underline guifg=#de7500 guibg=NONE guisp=NONE gui=underline ctermfg=172 ctermbg=NONE cterm=underline
hi GeBrown1BoldUnderline guifg=#de7500 guibg=NONE guisp=NONE gui=bold,underline ctermfg=172 ctermbg=NONE cterm=bold,underline
hi GeBrown1ItalicUnderline guifg=#de7500 guibg=NONE guisp=NONE gui=italic,underline ctermfg=172 ctermbg=NONE cterm=italic,underline
hi GeBrown1BoldItalic guifg=#de7500 guibg=NONE guisp=NONE gui=bold,italic ctermfg=172 ctermbg=NONE cterm=bold,italic
hi GeBrown1BoldItalicUnderline guifg=#de7500 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=172 ctermbg=NONE cterm=bold,italic,underline
" GeBrown2
hi GeBrown2 guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi GeBrown2Bold guifg=#ff8700 guibg=NONE guisp=NONE gui=bold ctermfg=208 ctermbg=NONE cterm=bold
hi GeBrown2Italic guifg=#ff8700 guibg=NONE guisp=NONE gui=italic ctermfg=208 ctermbg=NONE cterm=italic
hi GeBrown2Underline guifg=#ff8700 guibg=NONE guisp=NONE gui=underline ctermfg=208 ctermbg=NONE cterm=underline
hi GeBrown2BoldUnderline guifg=#ff8700 guibg=NONE guisp=NONE gui=bold,underline ctermfg=208 ctermbg=NONE cterm=bold,underline
hi GeBrown2ItalicUnderline guifg=#ff8700 guibg=NONE guisp=NONE gui=italic,underline ctermfg=208 ctermbg=NONE cterm=italic,underline
hi GeBrown2BoldItalic guifg=#ff8700 guibg=NONE guisp=NONE gui=bold,italic ctermfg=208 ctermbg=NONE cterm=bold,italic
hi GeBrown2BoldItalicUnderline guifg=#ff8700 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=208 ctermbg=NONE cterm=bold,italic,underline
" GeBrown3
hi GeBrown3 guifg=#ffa035 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi GeBrown3Bold guifg=#ffa035 guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
hi GeBrown3Italic guifg=#ffa035 guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic
hi GeBrown3Underline guifg=#ffa035 guibg=NONE guisp=NONE gui=underline ctermfg=215 ctermbg=NONE cterm=underline
hi GeBrown3BoldUnderline guifg=#ffa035 guibg=NONE guisp=NONE gui=bold,underline ctermfg=215 ctermbg=NONE cterm=bold,underline
hi GeBrown3ItalicUnderline guifg=#ffa035 guibg=NONE guisp=NONE gui=italic,underline ctermfg=215 ctermbg=NONE cterm=italic,underline
hi GeBrown3BoldItalic guifg=#ffa035 guibg=NONE guisp=NONE gui=bold,italic ctermfg=215 ctermbg=NONE cterm=bold,italic
hi GeBrown3BoldItalicUnderline guifg=#ffa035 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=215 ctermbg=NONE cterm=bold,italic,underline
" GeBrown4
hi GeBrown4 guifg=#ffb562 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi GeBrown4Bold guifg=#ffb562 guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
hi GeBrown4Italic guifg=#ffb562 guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic
hi GeBrown4Underline guifg=#ffb562 guibg=NONE guisp=NONE gui=underline ctermfg=215 ctermbg=NONE cterm=underline
hi GeBrown4BoldUnderline guifg=#ffb562 guibg=NONE guisp=NONE gui=bold,underline ctermfg=215 ctermbg=NONE cterm=bold,underline
hi GeBrown4ItalicUnderline guifg=#ffb562 guibg=NONE guisp=NONE gui=italic,underline ctermfg=215 ctermbg=NONE cterm=italic,underline
hi GeBrown4BoldItalic guifg=#ffb562 guibg=NONE guisp=NONE gui=bold,italic ctermfg=215 ctermbg=NONE cterm=bold,italic
hi GeBrown4BoldItalicUnderline guifg=#ffb562 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=215 ctermbg=NONE cterm=bold,italic,underline
" GeRed0
hi GeRed0 guifg=#ae0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
hi GeRed0Bold guifg=#ae0000 guibg=NONE guisp=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
hi GeRed0Italic guifg=#ae0000 guibg=NONE guisp=NONE gui=italic ctermfg=124 ctermbg=NONE cterm=italic
hi GeRed0Underline guifg=#ae0000 guibg=NONE guisp=NONE gui=underline ctermfg=124 ctermbg=NONE cterm=underline
hi GeRed0BoldUnderline guifg=#ae0000 guibg=NONE guisp=NONE gui=bold,underline ctermfg=124 ctermbg=NONE cterm=bold,underline
hi GeRed0ItalicUnderline guifg=#ae0000 guibg=NONE guisp=NONE gui=italic,underline ctermfg=124 ctermbg=NONE cterm=italic,underline
hi GeRed0BoldItalic guifg=#ae0000 guibg=NONE guisp=NONE gui=bold,italic ctermfg=124 ctermbg=NONE cterm=bold,italic
hi GeRed0BoldItalicUnderline guifg=#ae0000 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=124 ctermbg=NONE cterm=bold,italic,underline
" GeRed1
hi GeRed1 guifg=#de0000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
hi GeRed1Bold guifg=#de0000 guibg=NONE guisp=NONE gui=bold ctermfg=160 ctermbg=NONE cterm=bold
hi GeRed1Italic guifg=#de0000 guibg=NONE guisp=NONE gui=italic ctermfg=160 ctermbg=NONE cterm=italic
hi GeRed1Underline guifg=#de0000 guibg=NONE guisp=NONE gui=underline ctermfg=160 ctermbg=NONE cterm=underline
hi GeRed1BoldUnderline guifg=#de0000 guibg=NONE guisp=NONE gui=bold,underline ctermfg=160 ctermbg=NONE cterm=bold,underline
hi GeRed1ItalicUnderline guifg=#de0000 guibg=NONE guisp=NONE gui=italic,underline ctermfg=160 ctermbg=NONE cterm=italic,underline
hi GeRed1BoldItalic guifg=#de0000 guibg=NONE guisp=NONE gui=bold,italic ctermfg=160 ctermbg=NONE cterm=bold,italic
hi GeRed1BoldItalicUnderline guifg=#de0000 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=160 ctermbg=NONE cterm=bold,italic,underline
" GeRed2
hi GeRed2 guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi GeRed2Bold guifg=#ff0000 guibg=NONE guisp=NONE gui=bold ctermfg=196 ctermbg=NONE cterm=bold
hi GeRed2Italic guifg=#ff0000 guibg=NONE guisp=NONE gui=italic ctermfg=196 ctermbg=NONE cterm=italic
hi GeRed2Underline guifg=#ff0000 guibg=NONE guisp=NONE gui=underline ctermfg=196 ctermbg=NONE cterm=underline
hi GeRed2BoldUnderline guifg=#ff0000 guibg=NONE guisp=NONE gui=bold,underline ctermfg=196 ctermbg=NONE cterm=bold,underline
hi GeRed2ItalicUnderline guifg=#ff0000 guibg=NONE guisp=NONE gui=italic,underline ctermfg=196 ctermbg=NONE cterm=italic,underline
hi GeRed2BoldItalic guifg=#ff0000 guibg=NONE guisp=NONE gui=bold,italic ctermfg=196 ctermbg=NONE cterm=bold,italic
hi GeRed2BoldItalicUnderline guifg=#ff0000 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=196 ctermbg=NONE cterm=bold,italic,underline
" GeRed3
hi GeRed3 guifg=#ff3535 guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi GeRed3Bold guifg=#ff3535 guibg=NONE guisp=NONE gui=bold ctermfg=203 ctermbg=NONE cterm=bold
hi GeRed3Italic guifg=#ff3535 guibg=NONE guisp=NONE gui=italic ctermfg=203 ctermbg=NONE cterm=italic
hi GeRed3Underline guifg=#ff3535 guibg=NONE guisp=NONE gui=underline ctermfg=203 ctermbg=NONE cterm=underline
hi GeRed3BoldUnderline guifg=#ff3535 guibg=NONE guisp=NONE gui=bold,underline ctermfg=203 ctermbg=NONE cterm=bold,underline
hi GeRed3ItalicUnderline guifg=#ff3535 guibg=NONE guisp=NONE gui=italic,underline ctermfg=203 ctermbg=NONE cterm=italic,underline
hi GeRed3BoldItalic guifg=#ff3535 guibg=NONE guisp=NONE gui=bold,italic ctermfg=203 ctermbg=NONE cterm=bold,italic
hi GeRed3BoldItalicUnderline guifg=#ff3535 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=203 ctermbg=NONE cterm=bold,italic,underline
" GeRed4
hi GeRed4 guifg=#ff6262 guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi GeRed4Bold guifg=#ff6262 guibg=NONE guisp=NONE gui=bold ctermfg=203 ctermbg=NONE cterm=bold
hi GeRed4Italic guifg=#ff6262 guibg=NONE guisp=NONE gui=italic ctermfg=203 ctermbg=NONE cterm=italic
hi GeRed4Underline guifg=#ff6262 guibg=NONE guisp=NONE gui=underline ctermfg=203 ctermbg=NONE cterm=underline
hi GeRed4BoldUnderline guifg=#ff6262 guibg=NONE guisp=NONE gui=bold,underline ctermfg=203 ctermbg=NONE cterm=bold,underline
hi GeRed4ItalicUnderline guifg=#ff6262 guibg=NONE guisp=NONE gui=italic,underline ctermfg=203 ctermbg=NONE cterm=italic,underline
hi GeRed4BoldItalic guifg=#ff6262 guibg=NONE guisp=NONE gui=bold,italic ctermfg=203 ctermbg=NONE cterm=bold,italic
hi GeRed4BoldItalicUnderline guifg=#ff6262 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=203 ctermbg=NONE cterm=bold,italic,underline

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_10_basic.vim
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
  hi Search guifg=#e4e4e4 guibg=#FF6262 gui=italic
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
  hi Search guifg=#121212 guibg=#FF6262 gui=italic
endif

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_20_git_gutter.vim
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
  hi GitGutterChange guifg=#ae5c00 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
  hi GitGutterChangeLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
endif
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_30_lsp.vim
if &g:background=="light"
  hi LspErrorText guifg=#de0000 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=160 ctermbg=252 cterm=bold
  hi LspWarningText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi LspInformationText guifg=#00d700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=28 ctermbg=252 cterm=bold
  hi LspHintText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
  hi LspCodeActionText guifg=#ff8700 guibg=#d0d0d0 guisp=NONE gui=bold ctermfg=208 ctermbg=252 cterm=bold
else
  hi LspErrorText guifg=#FF6262 guibg=#262626 guisp=NONE gui=italic ctermfg=160 ctermbg=235 cterm=bold
  hi LspWarningText guifg=#ae5c00 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
  hi LspInformationText guifg=#56e156 guibg=#262626 guisp=NONE gui=NONE ctermfg=77 ctermbg=235 cterm=NONE
  hi LspHintText guifg=#ae5c00 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
  hi LspCodeActionText guifg=#ae5c00 guibg=#262626 guisp=none gui=none ctermfg=208 ctermbg=235 cterm=none
endif

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_40_airline.vim
let g:airline#themes#dark#palette = {}

let g:airline#themes#dark#palette.normal = {
\  'airline_a': [ '#e4e4e4' , '#008B00' , 17  , 190 ],
\  'airline_b': [ '#121212' , '#56E156' , 255 , 238 ],
\  'airline_c': [ '#FFB562' , '#2b2b2b' , 85  , 234 ],
\  'airline_x': [ '#121212' , '#00D700' , 85  , 234 ],
\  'airline_y': [ '#121212' , '#2DDA2D' , 255 , 238 ],
\  'airline_z': [ '#121212' , '#56E156' , 17  , 190 ]
\}

let g:airline#themes#dark#palette.insert = {
\  'airline_a': [ '#e4e4e4' , '#AE0000' , 17  , 190 ],
\  'airline_b': [ '#121212' , '#FF6262' , 255 , 238 ],
\  'airline_c': [ '#FFB562' , '#2b2b2b' , 85  , 234 ],
\  'airline_x': [ '#121212' , '#FF6262' , 85  , 234 ],
\  'airline_y': [ '#e4e4e4' , '#FF3535' , 255 , 238 ],
\  'airline_z': [ '#e4e4e4' , '#FF0000' , 17  , 190 ]
\}

let g:airline#themes#dark#palette.replace = {
\  'airline_a': [ '#e4e4e4' , '#AE0000' , 17  , 190 ],
\  'airline_b': [ '#121212' , '#FF6262' , 255 , 238 ],
\  'airline_c': [ '#FFB562' , '#2b2b2b' , 85  , 234 ],
\  'airline_x': [ '#121212' , '#FF6262' , 85  , 234 ],
\  'airline_y': [ '#e4e4e4' , '#FF3535' , 255 , 238 ],
\  'airline_z': [ '#e4e4e4' , '#FF0000' , 17  , 190 ]
\}

let g:airline#themes#dark#palette.visual = {
\  'airline_a': [ '#e4e4e4' , '#034D6D' , 17  , 190 ],
\  'airline_b': [ '#121212' , '#52A4C8' , 255 , 238 ],
\  'airline_c': [ '#FFB562' , '#2b2b2b' , 85  , 234 ],
\  'airline_x': [ '#e4e4e4' , '#0881B5' , 85  , 234 ],
\  'airline_y': [ '#121212' , '#2E90BB' , 255 , 238 ],
\  'airline_z': [ '#121212' , '#52A4C8' , 17  , 190 ]
\}

" let g:airline#themes#dark#palette.insert = g:airline#themes#dark#palette.replace
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_98_ge_constructs.vim
" normal text stays the same, keywords are roughly normal text
" immovable things are green - constants, static fields, singletons
" local variables, attributes of data (xml, yaml) are blue
" instance variables, and active state is red
" functions, decorators, classes, processors, important names are brown

if &g:background=="light"
  " files are separate for keeping in sync with dir
  hi! link GeFsDirectory GeBlue0Bold
  hi! link GeFsDirectoryLink GeBlue2
  hi! link GeFsDirectoryLinkTarget GeGray1Italic
  hi! link GeFsExecutable GeGreen0Bold
  hi! link GeFsExecutableLink GeGreen0BoldItalic
  hi! link GeFsExecutableLinkTarget GeGray1Italic

  " normal text
  hi! link GeNormal GeBlack
  hi! link GeNormalBold GeBlackBold
  hi! link GeNormalUnderline GeBlackUnderline
  hi! link GeNormalItalic GeBlackItalic
  hi! link GeNormalBoldItalic GeBlackBoldItalic
  hi! link GeKeyword GeGray2Bold
  hi! link GeKeywordItalic GeGray1BoldItalic

  " comments are distracting, so they're gray
  hi! link GeComment GeGray2Italic
  hi! link GeCommentNormal GeGray2
  hi! link GeCommentBold GeGray2Bold
  hi! link GeCommentBoldItalic GeGray2BoldItalic

  " immovable things
  hi! link GeConstant GeGreen0
  hi! link GeConstantItalic GeGreen0Italic
  hi! link GeConstantBold GeGreen0Bold

  " state
  hi! link GeState GeRed0
  hi! link GeStateItalic GeRed0Italic
  hi! link GeStateBold GeRed0Bold
  hi! link GeStateBoldItalic GeRed0BoldItalic

  " locals
  hi! link GeLocal GeBlue0Bold
  hi! link GeLocalItalic GeBlue0Italic
  hi! link GeLocalBold GeBlue0Bold

  " important things
  hi! link GeTitle GeBrown0Bold
  hi! link GeSubTitle GeBrown0
  hi! link GeSubTitleItalic GeBrown0Italic
  hi! link GeSubTitleBoldItalic GeBrown0BoldItalic
  hi! link GeProcessor GeBrown0Italic

  hi! link GeLink GeBlue0Underline
else
  " else &g:background=="dark"
  " files are separate for keeping in sync with dir
  hi! link GeFsDirectory GeBlue4Bold
  hi! link GeFsDirectoryLink GeBlue2Italic
  hi! link GeFsDirectoryLinkTarget GeGray3Italic
  hi! link GeFsExecutable GeGreen4Bold
  hi! link GeFsExecutableLink GeGreen4BoldItalic
  hi! link GeFsExecutableLinkTarget GeGray3Italic

  " normal text
  hi! link GeNormal GeWhite
  hi! link GeNormalBold GeWhiteBold
  hi! link GeNormalUnderline GeWhiteUnderline
  hi! link GeNormalItalic GeWhiteItalic
  hi! link GeNormalBoldItalic GeWhiteBoldItalic
  hi! link GeKeyword GeGray3Bold
  hi! link GeKeywordItalic GeGray5BoldItalic

  " comments are distracting, so they're gray
  hi! link GeComment GeGray2Italic
  hi! link GeCommentNormal GeGray2
  hi! link GeCommentBold GeGray2Bold
  hi! link GeCommentBoldItalic GeGray2BoldItalic

  " immovable things
  hi! link GeConstant GeGreen4
  hi! link GeConstantItalic GeGreen4Italic
  hi! link GeConstantBold GeGreen4Bold

  " state
  hi! link GeState GeRed4
  hi! link GeStateItalic GeRed4Italic
  hi! link GeStateBold GeRed4Bold
  hi! link GeStateBoldItalic GeRed4BoldItalic

  " locals
  hi! link GeLocal GeBlue4
  hi! link GeLocalItalic GeBlue4Italic
  hi! link GeLocalBold GeBlue4Bold

  " important things
  hi! link GeTitle GeBrown4Bold
  hi! link GeSubTitle GeBrown4
  hi! link GeSubTitleItalic GeBrown4Italic
  hi! link GeSubTitleBoldItalic GeBrown4BoldItalic
  hi! link GeProcessor GeBrown4Italic

  hi! link GeLink GeBlue4Underline
endif


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/colors/_parts/_99_vim_core.vim
" -------------------------------------------------------------------------
" vim core / all apps
" -------------------------------------------------------------------------
hi! link SpecialComment GeCommentSpecial
hi! link Comment GeComment
hi! link Quote GeComment
hi! link Keyword GeKeyword
hi! link Function GeFunction
hi! link Structure GeFunction
hi! link Operator GeKeyword
hi! link Statement GeKeyword
hi! link Include GeKeyword
hi! link Type GeKeyword
hi! link Constant GeConstant
hi! link Special GeConstantBold
hi! link SpecialKey GeSubTitle
hi! link String GeConstant
hi! link NonText GeComment
hi! link PreProc GeProcessor
hi! link Tag GeTitle
hi! link Title GeTitle
hi! link Todo GeState
hi! link Directory GeFsDirectory
hi! link Identifier GeLocal
hi! link Label GeLocal

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/asciidoc.vim
hi! link asciidocQuotedMonospaced2 GeConstant
hi! link asciidocMacro GeLink
hi! link asciidocMacroAttributes GeState
hi! link asciidocAttributeList GeComment
hi! link asciidocListingBlock GeComment
hi! link asciidocAdmonition GeSubTitleItalic
hi! link asciidocURL GeLink
hi! link asciidocCallout GeSubTitleItalic

function! AsciidocEnableSyntaxRanges()
" source block syntax highlighting
"          \, '\]\@<!\n[=-]\{4,\}\n'
if exists('g:loaded_SyntaxRange')
  for lang in ['c', 'python', 'javascript', 'cucumber', 'xml', 'typescript', 'sh', 'java', 'cpp', 'php', 'yaml', 'css', 'html', 'go', 'sql']
    call SyntaxRange#Include(
          \  '\c\[source\s*,\s*' . lang . '\s*\]\s*\n[=-]\{4,\}\n'
          \, '[=-]\{4,\}\n'
          \, lang, 'NonText')
  endfor

  call SyntaxRange#Include(
        \  '\c\[source\s*,\s*gherkin.*\]\s*\n[=-]\{4,\}\n'
        \, '\]\@<!\n[=-]\{4,\}\n'
        \, 'cucumber', 'NonText')

  call SyntaxRange#Include(
        \  '\c\[source\s*,\s*text.*\]\s*\n[=-]\{4,\}\n'
        \, '\]\@<!\n[=-]\{4,\}\n'
        \, 'plaintext', 'NonText')
endif
endfunction

" call AsciidocEnableSyntaxRanges()
command! AsciidocEnableSyntaxRanges call AsciidocEnableSyntaxRanges()
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/cpp.vim
hi! link cLabel GeKeyword
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/css.vim
hi! link cssStyle GeLocal
hi! link cssAttrRegion GeLocalBold
hi! link cssProp GeLocalBold
hi! link cssProp GeLocalBold
hi! link cssDefinition GeLocalBold
hi! link cssAttr GeConstant

hi! link cssVendor GeLocalItalic

hi! link cssImportant GeState

hi! link cssIdentifier GeSubTitleItalic
hi! link cssTagName GeTitle
hi! link cssClassName GeSubTitle
hi! link cssClassNameDot GeSubTitle
hi! link cssAttributeSelector GeSubTitle
hi! link cssSelectorOp GeSubTitle
hi! link cssSelectorOp2 GeSubTitle
hi! link cssBraces GeCommentNormal
hi! link cssFunctionName GeState
hi! link cssPseudoClassFn GeState
hi! link cssPseudoClass GeKeywordItalic
hi! link cssPseudoClassId GeStateItalic
hi! link cssAttrComma GeKeyword
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/desktop.vim
hi! link dtDelim Quote
hi! link dtGroup Title
hi! link dtLocaleKey Label
hi! link dtExecKey Label
hi! link dtTypeKey Label
hi! link dtStringKey Label
hi! link dtNumericKey Label
hi! link dtBooleanKey Label


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/dosini.vim
"ini
hi! link dosiniHeader GeTitle
hi! link dosiniLabel GeLocal

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/git.vim
hi! link diffAdded GeConstant

hi! link diffRemoved GeState
hi! link diffFile GeTitle
hi! link diffOldFile GeComment
hi! link diffNewFile GeComment
hi! link diffIndexLine GeSubTitleItalic
hi! link diffLine GeComment
hi! link diffSubname GeComment


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/gitcommit.vim
hi! link gitcommitHeader GeSubTitleItalic
hi! link gitcommitSelectedType GeNormalItalic
hi! link gitcommitSelectedFile GeConstantItalic
hi! link gitcommitType GeTitleItalic

hi! link gitcommitUntrackedFile GeComment
hi! link gitcommitSummary GeTitle
hi! link gitcommitBranch GeStateBoldItalic

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/gitconfig.vim
hi! link gitconfigSection GeTitle
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/go.vim

hi! link goDeclaration GeTitle

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/groovy.vim
hi! link groovyDocTags SpecialComment
hi! link groovyJDKBuiltin GeKeyword
hi! link groovyStatement GeKeyword


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/html.vim
hi! link htmlTagName GeNormalBold
hi! link htmlTag GeComment
hi! link htmlEndTag GeComment
hi! link htmlArg GeLocal
hi! link htmlSpecialTagame GeTitle

hi! link htmlH1 GeTitle
hi! link htmlH2 GeSubTitle
hi! link htmlH3 GeSubTitleItalic
hi! link htmlH4 GeNormalUnderline
hi! link htmlH5 GeNormalItalic
hi! link htmlH6 GeNormal

hi! link htmlLink GeLink
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/java.vim
hi! link javaAnnotation GeProcessor
hi! link javaDocTags GeComment
hi! link javaFold GeComment
hi! link javaConstant GeConstantItalic

hi! link javaScopeDecl GeKeyword
hi! link javaType GeKeyword
hi! link javaClassDecl GeKeyword
hi! link javaStorageClass GeKeyword
hi! link javaLabel GeKeyword


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/javascript.vim
hi! link javaScriptGlobal GeState
hi! link javaScriptIdentifier GeState
hi! link javaScriptFunction GeTitle
hi! link javaScriptLabel GeComment
hi! link javaScriptValue GeConstant
hi! link javaScriptNull GeConstantItalic
hi! link javaScriptMember GeState

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/json.vim
hi! link jsonBraces GeCommentNormal
hi! link jsonNull GeConstantItalic
hi! link jsonKeyword GeLocal

hi! link jsonNoise GeCommentNormal



" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/markdown.vim
hi! link markdownCode GeConstant
hi! link markdownCodeDelimiter GeConstantBold
hi! link markdownUrl GeLink
hi! link markdownLinkText GeState
hi! link markdownLinkDelimiter GeCommentNormal
hi! link markdownLinkTextDelimiter GeCommentNormal

hi! link markdownH1Delimiter htmlH1
hi! link markdownH2Delimiter htmlH2
hi! link markdownH3Delimiter htmlH3
hi! link markdownH4Delimiter htmlH4
hi! link markdownH5Delimiter htmlH5
hi! link markdownH6Delimiter htmlH6
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/nerdtree.vim
hi! link NERDTreeExecFile GeFsExecutable
hi! link NERDTreeDir GeFsDirectory
hi! link NERDTreeNodeDelimiters GeFsDirectory
hi! link NERDTreeOpenable GeFsDirectory
hi! link NERDTreeClosable GeFsDirectory
hi! link NERDTreeUp GeBlue2Italic
hi! link NERDTreeLinkFile GeFsDirectoryLink
hi! link NERDTreeLinkTarget GeFsExecutableLinkTarget
hi! link NERDTreeHelp GeComment
hi! link NERDTreeCWD GeTitle
hi! link NERDTreeCurrentNode GeTitle

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/perl.vim
hi! link perlSubName GeTitle
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/proto.vim
hi! link pbRPC YellowShade0Bold
hi! link pbFloat GeConstant

hi! link pbStructure GeTitle
hi! link pbRPC GeTitle


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/python.vim
" -------------------------------------------------------------------------
" python
" -------------------------------------------------------------------------
hi! link pythonBuiltin GeKeyword
hi! link pythonFunction GeTitle
hi! link pythonDecorator GeProcessor
hi! link pythonDecoratorName GeProcessor


" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/sh.vim
hi! link shDerefSimple GeState
hi! link shVariable GeState
hi! link shCmdSubRegion GeKeyword
hi! link shCommandSub GeNormalItalic
hi! link shOption GeSubTitleItalic
hi! link shQuote GeConstant
hi! link shFunction GeTitle
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/typescript.vim
hi! link typescriptBraces GeKeyword

hi! link typescriptReserved GeKeyword

hi! link typescriptFuncKeyword GeTitle

hi! link typescriptStorageClass GeKeyword
hi! link typescriptGlobalObjects GeState
hi! link typescriptGlobal GeNormal
hi! link typescriptDocTags GeCommentBoldItalic
hi! link typescriptDocParam GeNormalItalic
hi! link typescriptNull GeConstantItalic
" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/vim.vim
" -------------------------------------------------------------------------
" vim
" -------------------------------------------------------------------------
hi! link vimCommand GeKeyword
hi! link vimHiBang GeKeyword
hi! link vimHiGroup GeLocal
hi! link vimHiTerm GeLocal
hi! link vimGroup GeLocal
hi! link vimFunction GeTitle
hi! link vimUserFunc GeTitle
hi! link vueSurroundingTag GeTitle
hi! link vimOption GeState
hi! link vimEnvVar GeStateItalic
hi! link vimHiAttrib GeConstant

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/xml.vim
hi! link xmlTag GeNormal
hi! link xmlTagName GeNormalBold
hi! link xmlEndTag GeNormalBold
hi! link xmlAttribPunct GeCommentNormal
hi! link xmlProcessingDelim GeProcessor
hi! link xmlAttrib GeLocal
hi! link xmlNamespace GeCommentNormal

hi! link xmlEntity GeConstantBold
hi! link xmlEntityPunct GeConstantBold

" > /home/raptor/dotfiles/.vim/plugged/zzzgespace/ftplugin/yaml.vim
hi! link yamlFlowIndicator GeCommentNormal
hi! link yamlFlowCollection GeCommentNormal
hi! link yamlBlockCollectionItemStart GeCommentNormal
hi! link yamlBlockMappingKey GeLocal
hi! link yamlKeyValueDelimiter GeCommentNormal
hi! link yamlPlainScalar GeConstant
hi! link yamlFlowStringDelimiter GeCommentNormal
hi! link yamlFlowMapping GeComment
