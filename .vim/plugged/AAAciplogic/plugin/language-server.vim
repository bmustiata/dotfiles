let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" FIXME: detect if the terminal is normal and can deal with emojis
"let g:lsp_diagnostics_signs_error = {'text': '❌'}
"let g:lsp_diagnostics_signs_warning = {'text': '⚠️'}
"let g:lsp_diagnostics_signs_hint = {'text': '☝️'}
let g:lsp_diagnostics_signs_error = {'text': 'X'}
let g:lsp_diagnostics_signs_warning = {'text': '!'}
let g:lsp_diagnostics_signs_hint = {'text': '?'}
let g:lsp_highlight_references_enabled = 1

set previewheight=10

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gf :LspDocumentFormatSync<CR>
nnoremap <silent> H :LspHover<CR>



" -------------------------------------------------------------------------
" Python Support
" -------------------------------------------------------------------------
" pip install python-lsp-server       # obviously
"             rope                    # rename support
"             mypy mypy-ls            # type checks
"             black python-lsp-black  # formatting
"             pyls-memestra           # deprecated APIs
" Configuration for vim-lsp

if executable('pylsp')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python', 'X_Python.python']
        \ })
endif

function! PythonLspInstall()
    !pip install -U python-lsp-server rope mypy mypy-ls black python-lsp-black pyls-memestra
endfunction
command PythonLspInstall call PythonLspInstall()

" -------------------------------------------------------------------------
" golang support
" -------------------------------------------------------------------------
if executable('gopls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go']
        \ })
endif

" -------------------------------------------------------------------------
" General config
" -------------------------------------------------------------------------

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

