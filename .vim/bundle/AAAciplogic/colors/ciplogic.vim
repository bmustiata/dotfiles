if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

function! SetLightColors()
  hi Normal guifg=#121212 guibg=#e4e4e4 guisp=NONE gui=NONE ctermfg=233 ctermbg=254 cterm=NONE

  " -------------------------------------------------------------------------
  " gray
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#000000 guibg=NONE guisp=NONE gui=NONE ctermfg=00 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi Shade2 guifg=#767676 guibg=NONE guisp=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#d0d0d0 guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
  hi Shade5 guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
  hi Shade6 guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE

  hi Comment guifg=#767676 guibg=NONE guisp=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
  hi Function guifg=#121212 guibg=#e4e4e4 guisp=NONE gui=NONE ctermfg=233 ctermbg=254 cterm=NONE

  hi javaScriptGlobal guifg=#121212 guibg=#e4e4e4 guisp=NONE gui=NONE ctermfg=233 ctermbg=254 cterm=NONE

  " -------------------------------------------------------------------------
  " green
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#00d700 guibg=NONE guisp=NONE gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#00af00 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#008700 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE

  hi Constant guifg=#008700 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
  hi Special guifg=#008700 guibg=NONE guisp=NONE gui=bold ctermfg=28 ctermbg=NONE cterm=bold

  " -------------------------------------------------------------------------
  " blue
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#0087af guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#005f87 guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE

  hi Identifier guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
  hi Label guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
  hi Title guifg=#005f5f guibg=NONE guisp=NONE gui=bold ctermfg=23 ctermbg=NONE cterm=bold

  hi yamlBlockMappingKey guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
  hi yamlKeyValueDelimiter guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE

  hi xmlTagName guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
  hi xmlTag guifg=#005f5f guibg=NONE guisp=NONE gui=bold ctermfg=23 ctermbg=NONE cterm=bold
  " -------------------------------------------------------------------------
  " yellow
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#d78700 guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#af5f00 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE

  "hi Statement guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  hi Include guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold

  hi pythonBuiltin guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  hi pythonDecorator guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  hi pythonDecoratorName guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold

  hi javaScriptFunction guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  hi javaScriptLabel guifg=#af5f00 guibg=NONE guisp=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  " -------------------------------------------------------------------------
  " red
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=09 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#d70000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
  hi Shade5 guifg=#af0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE

  hi javaScriptMember guifg=#af0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
  hi javaScriptIdentifier guifg=#af0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
  hi xmlAttrib guifg=#af0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE
endfunction

" -------------------------------------------------------------------------
" Dark colors are set when the background is marked as "dark"
" -------------------------------------------------------------------------
function! SetDarkColors()
  hi Normal guifg=#e4e4e4 guibg=#121212 guisp=NONE gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
  hi LineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi CursorLineNr guifg=#ffffff guibg=#262626 guisp=NONE gui=bold ctermfg=15 ctermbg=235 cterm=bold
  hi SignColumn guifg=#ffffff guibg=#262626 guisp=NONE gui=NONE ctermfg=15 ctermbg=235 cterm=NONE

  " -------------------------------------------------------------------------
  " gray
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#000000 guibg=NONE guisp=NONE gui=NONE ctermfg=0 ctermbg=NONE cterm=NONE
  hi Shade0 guifg=#262626 guibg=NONE guisp=NONE gui=NONE ctermfg=235 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi Shade2 guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#bcbcbc guibg=NONE guisp=NONE gui=NONE ctermfg=250 ctermbg=NONE cterm=NONE
  hi Shade5 guifg=#d0d0d0 guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
  hi Shade6 guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
  hi Shade7 guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE

  hi SpecialComment guifg=#a8a8a8 guibg=NONE guisp=NONE gui=italic ctermfg=248 ctermbg=NONE cterm=italic
  hi Comment guifg=#6c6c6c guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=italic
  hi Quote guifg=#6c6c6c guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
  hi Function guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold
  hi Structure guifg=#e4e4e4 guibg=NONE guisp=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold
  hi Operator guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold

  hi Statement guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi Include guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi Type guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi gitcommitUntrackedFile guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold
  hi gitcommitSummary guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE

  hi groovyJDKBuiltin guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold

  hi htmlTagName guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
  hi htmlTag guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
  hi htmlEndTag guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold

  hi javaAnnotation guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi javaDocTags guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi javaScriptGlobal guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
  hi javaScriptIdentifier guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi javaScriptFunction guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi javaScriptLabel guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi jsonBraces guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold
  hi jsonNoise guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE

  " nerdtree
  hi NERDTreeFile guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi pythonBuiltin guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi shArithmetic guifg=#e4e4e4 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
  hi shCommandSub guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi typescriptLabel guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi typescriptStorageClass guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi typescriptGlobalObjects guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi typescriptLogicSymbols guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold
  hi typescriptBraces guifg=#a8a8a8 guibg=NONE guisp=NONE gui=bold ctermfg=248 ctermbg=NONE cterm=bold

  " vim UI
  hi VertSplit guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  hi PMenu guifg=#e4e4e4 guibg=#444444 guisp=NONE gui=NONE ctermfg=254 ctermbg=238 cterm=NONE

  hi vimGroup guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi vimGroupName guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE

  hi yamlFlowIndicator guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold

  hi xmlTag guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
  hi xmlTagName guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
  hi xmlEndTag guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
  hi xmlNamespace guifg=#a8a8a8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
  hi xmlAttribPunct guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
  " -------------------------------------------------------------------------
  " green
  " -------------------------------------------------------------------------
  hi Shade1 guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#00af00 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#008700 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE

  hi Constant guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
  hi Special guifg=#00af00 guibg=NONE guisp=NONE gui=bold ctermfg=34 ctermbg=NONE cterm=bold

  hi cssAttrRegion guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
  hi cssAttr guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE

  hi GitGutterAdd guifg=#5fd75f guibg=#262626 guisp=NONE gui=NONE ctermfg=77 ctermbg=235 cterm=NONE
  hi GitGutterAddLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE

  hi javaScriptValue guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
  hi javaScriptNull guifg=#5fd75f guibg=NONE guisp=NONE gui=italic ctermfg=77 ctermbg=NONE cterm=italic

  hi jsonNull guifg=#5fd75f guibg=NONE guisp=NONE gui=italic ctermfg=77 ctermbg=NONE cterm=italic

  " nerdtree
  hi NERDTreeExecFile guifg=#008700 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
  hi def link NERDTreeLinkTarget Comment

  hi vimHiAttrib guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE

  " -------------------------------------------------------------------------
  " blue
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#0087af guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#005f87 guibg=NONE guisp=NONE gui=NONE ctermfg=24 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE

  hi Identifier guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi Label guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi Title guifg=#5fafd7 guibg=NONE guisp=NONE gui=bold ctermfg=74 ctermbg=NONE cterm=bold

  hi cssProp guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi cssDefinition guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi cssStyle guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE

  hi gitcommitHeader guifg=#5fafd7 guibg=NONE guisp=NONE gui=bold ctermfg=74 ctermbg=NONE cterm=bold

  hi jsonKeyword guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE

  hi htmlArg guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE

  " nerdtree
  hi Directory guifg=#0087af guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
  hi NERDTreeLinkFile guifg=#005f5f guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE

  hi vimSynOption guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi vimHiTerm guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE

  hi yamlBlockMappingKey guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
  hi yamlKeyValueDelimiter guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE

  hi xmlAttrib guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE

  " -------------------------------------------------------------------------
  " yellow
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#ff8700 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi Shade3 guifg=#d78700 guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#af5f00 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE

  hi PreProc guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi Tag guifg=#ffaf5f guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold

  hi gitcommitSelectedType guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi gitcommitType guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE

  hi GitGutterChange guifg=#ff8700 guibg=#262626 guisp=NONE gui=NONE ctermfg=208 ctermbg=235 cterm=NONE
  hi GitGutterChangeLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE

  hi htmlSpecialTagName guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE

  hi javaScopeDecl guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi javaType guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi javaClassDecl guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi javaStorageClass guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
  hi javaLabel guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE

  hi pythonFunction guifg=#ffaf5f guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
  hi pythonDecorator guifg=#ffaf5f guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic
  hi pythonDecoratorName guifg=#ffaf5f guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic

  hi typescriptDecorators guifg=#ffaf5f guibg=NONE guisp=NONE gui=italic ctermfg=215 ctermbg=NONE cterm=italic

  " vim UI
  hi PMenuSel guifg=#000000 guibg=#ffaf5f guisp=NONE gui=NONE ctermfg=0 ctermbg=215 cterm=NONE


  hi vueSurroundingTag guifg=#ffaf5f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE

  " -------------------------------------------------------------------------
  " red
  " -------------------------------------------------------------------------
  hi Shade0 guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=09 ctermbg=NONE cterm=NONE
  hi Shade1 guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
  hi Shade4 guifg=#d70000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
  hi Shade5 guifg=#af0000 guibg=NONE guisp=NONE gui=NONE ctermfg=124 ctermbg=NONE cterm=NONE

  hi Todo guifg=#d70000 guibg=NONE guisp=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE

  hi cssVendor guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE

  hi gitcommitBranch guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE

  hi GitGutterDelete guifg=#d70000 guibg=#262626 guisp=NONE gui=bold ctermfg=160 ctermbg=235 cterm=bold
  hi GitGutterDeleteLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
  hi GitGutterChangeDeleteLineNr guifg=#e4e4e4 guibg=#262626 guisp=NONE gui=NONE ctermfg=254 ctermbg=235 cterm=NONE

  hi javaScriptMember guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE

  hi vimOption guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
endfunction

set t_Co=256

if &g:background=="light"
    call SetLightColors()
else
    call SetDarkColors()
endif

let g:colors_name = "ciplogic"

