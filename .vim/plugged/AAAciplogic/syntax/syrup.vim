if exists("b:current_syntax")
  finish
endif

syn match syComment '//.*'

syn match syString '"\_.\{-0,1000}"'
syn match syNumber '\d'

syn keyword syKeyword if while ret var not in throw class struct variant
syn keyword syKeyword void i8 u8 i16 u16 i32 u32 i64 u64 f32 f64

hi def link syComment Comment
hi def link ucVariable BlueShade1

hi def link syString String
hi def link syNumber String

hi def link syKeyword Keyword

