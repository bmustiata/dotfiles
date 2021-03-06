" nerdtree color fix
hi Directory guifg=#aaaaff

" returns true iff is NERDTree open/active
function! Ciplogic_isNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! Ciplogic_ToggleNerdTree()
  if Ciplogic_isNTOpen()
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfunction

" show/hide the nerdtree
" map <c-n> :NERDTreeToggle<cr>
map <c-n> :call Ciplogic_ToggleNerdTree()<cr>

" -------------------------------------------------------------------------
" Use icons that don't trash in case unicode support sucks in the term.
" -------------------------------------------------------------------------
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" -------------------------------------------------------------------------
" Make the tree by default larger.
" -------------------------------------------------------------------------
let g:NERDTreeWinSize = 60

let NERDTreeIgnore = ['\.pyc$', '__pycache__']
