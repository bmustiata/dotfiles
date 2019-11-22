set foldmethod=indent
Spaces4

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
        \ 'whitelist': ['X_Python.python', 'python']
        \ })
endif

