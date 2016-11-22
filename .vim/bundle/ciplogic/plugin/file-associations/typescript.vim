function! TypeScriptDefaults()
    au BufRead,BufNewFile *.ts set filetype=ts.typescript
    au BufRead,BufNewFile *.tsx set filetype=tsx_X.typescript
    au BufRead,BufNewFile *.d.ts set filetype=tsd.typescript
endfunction
call TypeScriptDefaults()
command TypeScriptDefaults call TypeScriptDefaults()

function! TypeScriptMobX()
    au BufRead,BufNewFile *.ts set filetype=ts.typescript
    au BufRead,BufNewFile *.tsx set filetype=tsx_mobx.tsx_X.typescript
    au BufRead,BufNewFile *.d.ts set filetype=tsd.typescript
endfunction
command TypeScriptMobX call TypeScriptMobX()

