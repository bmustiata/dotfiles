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

syn keyword syKeyword false
syn keyword syKeyword true
syn keyword syKeyword as
syn keyword syKeyword break
syn keyword syKeyword catch
syn keyword syKeyword continue
syn keyword syKeyword class
syn keyword syKeyword extend
syn keyword syKeyword finally
syn keyword syKeyword for
syn keyword syKeyword if
syn keyword syKeyword in
syn keyword syKeyword is
syn keyword syKeyword package
syn keyword syKeyword return
syn keyword syKeyword not
syn keyword syKeyword struct
syn keyword syKeyword try
syn keyword syKeyword throw
syn keyword syKeyword use
syn keyword syKeyword variant
syn keyword syKeyword while

syn keyword syPrimitiveType ptr
syn keyword syPrimitiveType i64
syn keyword syPrimitiveType i32
syn keyword syPrimitiveType i16
syn keyword syPrimitiveType i8
syn keyword syPrimitiveType u8
syn keyword syPrimitiveType void
syn keyword syPrimitiveType str
syn keyword syPrimitiveType bool
syn keyword syPrimitiveType var

hi def link syComment Comment
hi def link syBlockComment Comment
hi def link syPrimitiveType GeGray2Italic

hi def link syString String
hi def link syNumber String
hi def link syBool String

hi def link syKeyword Keyword

hi def link syNative GeRed4Italic

hi def link syNativeStart Keyword

