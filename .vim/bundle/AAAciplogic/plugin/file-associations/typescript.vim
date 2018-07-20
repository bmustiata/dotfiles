function! TypeScriptDefaults()
    au BufRead,BufNewFile *.ts set filetype=X_ts.typescript
    au BufRead,BufNewFile *.tsx set filetype=X_tsx.typescript
    au BufRead,BufNewFile *.d.ts set filetype=X_tsd.typescript
endfunction
call TypeScriptDefaults()
command TypeScriptDefaults call TypeScriptDefaults()

function! TypeScriptMobX()
    au BufRead,BufNewFile *.ts set filetype=X_ts.typescript
    au BufRead,BufNewFile *.tsx set filetype=tsx_mobx.X_tsx.typescript
    au BufRead,BufNewFile *.d.ts set filetype=X_tsd.typescript
endfunction
command TypeScriptMobX call TypeScriptMobX()

