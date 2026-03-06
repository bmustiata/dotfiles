if exists("b:current_syntax")
  finish
endif

syn case ignore
syn keyword jclKwd pgm proc class dsn[ame] msgclass space disp contained
syn keyword jclKwd parm member cond msglevel order lrecl recfm unit contained
syn keyword jclKwd sysout outlim blksize region dcb amp contained
syn keyword jclKwd then shr old new mod catlg rlse delete pass keep contained
syn keyword jclKwd cyl trk vol retain ser label recorg sysda contained
syn keyword jclKwd dummy  contained
syn keyword jclCKwd pgm proc class dsn[ame] msgclass space disp contained
syn keyword jclCKwd parm member cond msglevel order lrecl recfm unit contained
syn keyword jclCKwd sysout outlim blksize region dcb amp contained
syn keyword jclCKwd then shr old new mod catlg rlse delete pass keep contained
syn keyword jclCKwd cyl trk vol retain ser label recorg sysda contained
syn keyword jclCKwd dummy  contained
syn keyword jclPgm idcams iebcopy sort icegener adrdssu ftp rexec contained
syn keyword jclPgm iebgener iefbr14 contained
syn keyword jclCPgm idcams iebcopy sort icegener adrdssu ftp rexec contained
syn keyword jclCPgm iebgener iefbr14 contained
"
" Matches main command and special dd
"
syn match jclMainCommand +^//[^* ]*\s\+EXEC+hs=e-3  contained
syn match jclMainCommand +^//[^* ]*\s\+DD+hs=e-1  contained
syn match jclMainCommand +^//[^* ]*\s\+INCLUDE+hs=e-6 contained
syn match jclMainCommand +^//[^* ]*\s\+JCLLIB+hs=e-5 contained
syn match jclMainCommand +^//[^* ]*\s\+JOB+hs=e-2 contained
syn match jclMainCommand +^//[^* ]*\s\+SET+hs=e-2 contained
syn match jclCMainCommand +^//[^* ]*\s\+EXEC+hs=e-3 contained
syn match jclCMainCommand +^//[^* ]*\s\+DD+hs=e-1 contained
syn match jclCMainCommand +^//[^* ]*\s\+INCLUDE+hs=e-6 contained
syn match jclCMainCommand +^//[^* ]*\s\+JCLLIB+hs=e-5 contained
syn match jclCMainCommand +^//[^* ]*\s\+JOB+hs=e-2 contained
syn match jclCMainCommand +^//[^* ]*\s\+SET+hs=e-2 contained
syn match jclCond +^//[^* ]*\s\+ELSE+ contained
syn match jclOperator  "[()]" contained
syn match jclCOperator +[()]+ contained
syn match jclNumber +\<\d\+\>+ contained
syn match jclCNumber +\<\d\+\>+ contained
syn match jclDsn +\(\(\w\{1,8}\.\)\+\w\{1,8}\((\w\{1,8})\)\?\|\(&&\w\{1,8}\)\)+ contained
syn match jclCDsn +\(\(\w\{1,8}\.\)\+\w\{1,8}\((\w\{1,8})\)\?\|\(&&\w\{1,8}\)\)+ contained
syn region  jclDblQuote	start=+"+ skip=+[^"]+ end=+"+ contained
syn region  jclSnglQuote start=+'+ skip=+[^']+ end=+'+ contained
syn region  jclCDblQuote start=+"+ skip=+[^"]+ end=+"+ contained
syn region  jclCSnglQuote start=+'+ skip=+[^']+ end=+'+ contained

syn cluster jclConditional contains=jclCMainCommand,jclCIF,jclCData,jclCKwd,jclCond,jclCDblQuote,jclCSnglQuote,jclCComment,jclCOperator,jclCDsn,jclCPgm,jclCNumber
syn region jclIF matchgroup=jclCond start=+^//\w*\s\+IF+ end=+^//\w*\s\+ENDIF+ contains=@jclConditional contained
syn region jclCIF matchgroup=jclCond start=+^//\w*\s\+IF+ end=+^//\w*\s\+ENDIF+ contains=@jclConditional contained
syn match jclCComment 	+^//\*.*$+ contained

syn cluster jclNonConditional contains=jclMainCommand,jclKwd,jclIf,jclOperator,jclDblQuote,jclSnglQuote,jclDsn,jclPgm,jclNumber
" High level matches
syn match jclComment 	+^//\*.*$+
"syn match jclData 	+^[^/].*$+
syn match jclData 	+^\([^/]\|/[^*/]\).*$+
syn match jclStatement  +^//[^*].*$+ transparent contains=@jclNonConditional
syn match jclCData 	+^\([^/]\|/[^*/]\).*$+ contained
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet

hi def link jclIF	Normal
hi def link jclCIF	Normal
hi def link jclCond	WarningMsg
hi def link jclCComm Statement
hi def link jclCComment Comment
hi def link jclKwd Statement
hi def link jclCKwd Statement
hi def link jclMainCommand Type
hi def link jclCMainCommand WarningMsg
hi def link jclOperator  Operator
hi def link jclCOperator Operator
hi def link jclDsn Normal
hi def link jclCDsn Normal
hi def link jclData Special
hi def link jclCData Special
hi def link jclPgm Function
hi def link jclCPgm Function
hi def link jclNumber Number
hi def link jclCNumber Number
hi def link jclDblQuote	jclSnglQuote
hi def link jclSnglQuote	String
hi def link jclCDblQuote	jclCSnglQuote
hi def link jclCSnglQuote	String
hi def link jclCIF jclIF
hi def link jclComment		Comment
hi def link jclCComment		Comment
hi def link jclComm		Statement
hi def link jclLabel		Label

" let b:current_syntax = "jcl"

set expandtab
