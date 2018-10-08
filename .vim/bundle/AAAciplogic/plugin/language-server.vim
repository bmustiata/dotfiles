set hidden

" pyls requires: pip install python-language-server, pyls-mypy, mypy
" go-langserver requires: go get -u github.com/sourcegraph/go-langserver
" ts requires javascript-typescript-langserver
let g:LanguageClient_serverCommands = {
    \ 'X_python.python': ['pyls'],
    \ 'X_test_python.X_python.python': ['pyls'],
    \ 'X_python': ['pyls'],
    \ 'python': ['pyls'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'],
    \ }

function! FindReferences()
    call LanguageClient#textDocument_references()
    sleep 400m
    lopen
endfunction

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> cm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gr :call FindReferences()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> rr :call LanguageClient#textDocument_rename()<CR>

