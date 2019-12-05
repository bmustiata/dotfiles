let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_hint = {'text': 'x'}
let g:lsp_highlight_references_enabled = 1

set previewheight=10

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> H :LspHover<CR>

" pip install python-language-server  # obviously
"             rope                    # rename support
"             mypy pyls-mypy          # type checks
"             pycodestyle             # format checks
" Configuration for vim-lsp
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['X_Adhesive.X_Python.python', 'X_Python.python', 'python']
        \ })
endif


