if exists("b:current_syntax")
  finish
endif


syn match syString '"\_.\{-0,1000}"'
syn match syNumber '\d'
syn match syArrow '->'

syn keyword syKeyword if while ret var not in throw class struct variant switch case default
syn keyword syKeyword void i8 u8 i16 u16 i32 u32 i64 u64 f32 f64 ptr str



syn region	cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cSpaceError,@Spell
if exists("c_no_comment_fold")
syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell extend
else
syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell fold extend
endif

syn region	cNative	matchgroup=cNativeStart start="native {" end="}" extend


hi def link cComment Comment
hi def link cCommentStart Comment
hi def link cCommentL Comment
hi def link ucVariable BlueShade1
hi def link cNative Normal
hi def link cNativeStart Comment

hi def link syString String
hi def link syNumber String

hi def link syKeyword Keyword
hi def link syArrow Comment

