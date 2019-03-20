" -------------------------------------------------------------------------
" Default settings from:
" https://github.com/vim-syntastic/syntastic
" -------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" -------------------------------------------------------------------------
" Increase the size of the preview, the documentation text for function
" from python jedi for example.
" -------------------------------------------------------------------------
set previewheight=50
au BufEnter,WinEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc

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
let g:syntastic_python_checkers = ['mypy', 'flake8']
au BufRead,BufNewFile */site-packages/* let b:syntastic_mode = 'passive'

let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': ['javascript', 'python'],
                            \ 'passive_filetypes': ['java'] }

" -------------------------------------------------------------------------
" Make sure that the checks for tidy ignore vue attributes,
" and knows about the meta value stuff.
" -------------------------------------------------------------------------
let g:syntastic_html_tidy_ignore_errors = [
    \ '<meta> proprietary attribute "value"',
    \ '<img> lacks "']

"
" Register an attribute name as known to the html tidy (aka directive)
"
function! RegisterAttributeName(name)
    call add(g:syntastic_html_tidy_ignore_errors, ' proprietary attribute "' . a:name . '"')
endfunction
command -nargs=1 RegisterAttributeName call RegisterAttributeName(<f-args>)

" -------------------------------------------------------------------------
" Registes a single tag into the rules of tidy
" -------------------------------------------------------------------------
function! RegisterTagName(name)
    call add(g:syntastic_html_tidy_ignore_errors, '<' . a:name . '> is not recognized!')
    call add(g:syntastic_html_tidy_ignore_errors, 'discarding unexpected <' . a:name . '>')
    call add(g:syntastic_html_tidy_ignore_errors, 'discarding unexpected </' . a:name . '>')
endfunction
command -nargs=1 RegisterTagName call RegisterTagName(<f-args>)

" -------------------------------------------------------------------------
" Register some custom text to be ignored.
" -------------------------------------------------------------------------
function! RegisterCustomText(text)
    call add(g:syntastic_html_tidy_ignore_errors, a:text)
endfunction
command -nargs=1 RegisterCustomText call RegisterCustomText(<f-args>)

