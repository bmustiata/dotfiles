" -------------------------------------------------------------------------
" Default settings from:
" https://github.com/vim-syntastic/syntastic
" -------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -------------------------------------------------------------------------
" = eslint installation.
" In order to get eslint working in vim, you need to:
"
" npm install -g eslint
" npm install -g eslint-plugin-import
" npm install -g eslint-config-airbnb-base
"
" -------------------------------------------------------------------------

" -------------------------------------------------------------------------
" Enable the eslint checker for javascript files.
" -------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['javascript'],
                            \ 'passive_filetypes': [] }
