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
syn keyword syKeyword and
syn keyword syKeyword break
syn keyword syKeyword catch
syn keyword syKeyword class
syn keyword syKeyword continue
syn keyword syKeyword extends
syn keyword syKeyword finally
syn keyword syKeyword for
syn keyword syKeyword if
syn keyword syKeyword implements
syn keyword syKeyword in
syn keyword syKeyword interface
syn keyword syKeyword is
syn keyword syKeyword module
syn keyword syKeyword new
syn keyword syKeyword not
syn keyword syKeyword or
syn keyword syKeyword return
syn keyword syKeyword tag
syn keyword syKeyword throw
syn keyword syKeyword try
syn keyword syKeyword use
syn keyword syKeyword var
syn keyword syKeyword while
syn keyword syKeyword yield

syn keyword syPrimitiveType ptr
syn keyword syPrimitiveType u64
syn keyword syPrimitiveType i64
syn keyword syPrimitiveType u32
syn keyword syPrimitiveType i32
syn keyword syPrimitiveType u16
syn keyword syPrimitiveType i16
syn keyword syPrimitiveType u8
syn keyword syPrimitiveType i8
syn keyword syPrimitiveType f32
syn keyword syPrimitiveType f64
syn keyword syPrimitiveType void
syn keyword syPrimitiveType str
syn keyword syPrimitiveType bool
syn keyword syPrimitiveType var

syn keyword syCollectionType list
syn keyword syCollectionType map
syn keyword syCollectionType set

hi def link syComment Comment
hi def link syBlockComment Comment
hi def link syPrimitiveType GeGray3Italic
hi def link syCollectionType GeGray3Italic

hi def link syString String
hi def link syNumber String
hi def link syBool String

hi def link syKeyword Keyword

hi def link syNative GeRed4Italic

hi def link syNativeStart Keyword

