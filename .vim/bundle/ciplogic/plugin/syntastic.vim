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
let g:syntastic_python_checkers = ['flake8', 'pep8', 'python']

let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['javascript'],
                            \ 'passive_filetypes': [] }

" -------------------------------------------------------------------------
" Make sure that the checks for tidy ignore vue attributes,
" and knows about the meta value stuff.
" -------------------------------------------------------------------------
let g:syntastic_html_tidy_ignore_errors = [
    \ '<meta> proprietary attribute "value"']

"
" Register an attribute name as known to the html tidy (aka directive)
"
function! RegisterAttributeName(name)
    call add(g:syntastic_html_tidy_ignore_errors, ' proprietary attribute "' . a:name . '"')
endfunction
command -nargs=1 RegisterAttributeName call RegisterAttributeName(<f-args>)

function! RegisterVueAttributes()
    call add(g:syntastic_html_tidy_ignore_errors, ' attribute name ":')
    call add(g:syntastic_html_tidy_ignore_errors, ' attribute name "@')

    call RegisterAttributeName("v-if")
    call RegisterAttributeName("v-else")
    call RegisterAttributeName("v-for")
endfunction

" -------------------------------------------------------------------------
" Registes a single tag into the rules of tidy
" -------------------------------------------------------------------------
function! RegisterTagName(name)
    call add(g:syntastic_html_tidy_ignore_errors, '<' . a:name . '> is not recognized!')
    call add(g:syntastic_html_tidy_ignore_errors, 'discarding unexpected <' . a:name . '>')
    call add(g:syntastic_html_tidy_ignore_errors, 'discarding unexpected </' . a:name . '>')
endfunction
command -nargs=1 RegisterTagName call RegisterTagName(<f-args>)

function! InfinicaSyntastic()
    call RegisterVueAttributes()

    call RegisterAttributeName("v-if")
    call RegisterAttributeName("v-else")
    call RegisterAttributeName("v-for")

    call RegisterTagName("infinica-camera")
    call RegisterTagName("infinica-data-image")
endfunction
command InfinicaSyntastic call InfinicaSyntastic()

InfinicaSyntastic
