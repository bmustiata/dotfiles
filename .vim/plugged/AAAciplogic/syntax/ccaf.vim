if exists("b:current_syntax")
  finish
endif

syn match syComment '//.*'
syn region syBlockComment start="/\*"  end="\*/"
syn region syNative start="native {"  end="}" keepend contains=syNativeStart,syNativeStartCurly,syNativeEndCurly
syn match syNativeStart /native/ contained conceal
syn match syNativeStartCurly /{/ contained conceal
syn match syNativeEndCurly /}/ contained conceal


syn match syString '"\_.\{-0,1000}"'
syn match syNumber '\d'

syn keyword syKeyword as
syn keyword syKeyword catch
syn keyword syKeyword class
syn keyword syKeyword finally
syn keyword syKeyword for
syn keyword syKeyword if
syn keyword syKeyword in
syn keyword syKeyword is
syn keyword syKeyword package
syn keyword syKeyword ret
syn keyword syKeyword not
syn keyword syKeyword struct
syn keyword syKeyword try
syn keyword syKeyword throw
syn keyword syKeyword use
syn keyword syKeyword var
syn keyword syKeyword variant
syn keyword syKeyword while

syn keyword syPrimitiveType ptr i64 i32 i16 i8 u8 void str bool

hi def link syComment Comment
hi def link syBlockComment Comment
hi def link syPrimitiveType GeNormalItalic

hi def link syString String
hi def link syNumber String

hi def link syKeyword Keyword

hi def link syNative GeRed4Italic

hi def link syNativeStart Keyword

