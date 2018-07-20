set hidden

" pyls requires: pip install python-language-server, pyls-mypy, mypy
" ts requires javascript-typescript-langserver
let g:LanguageClient_serverCommands = {
    \ 'X_python.python': ['pyls'],
    \ 'X_python': ['pyls'],
    \ 'python': ['pyls'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> cm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

