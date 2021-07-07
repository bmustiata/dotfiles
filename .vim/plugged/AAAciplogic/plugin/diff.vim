function! DiffNew()
    tabnew
    diffthis
    vsplit
    wincmd l
    enew
    diffthis
endfunction
command DiffNew call DiffNew()

function! DiffThis()
    diffthis
    vsplit
    wincmd l
    enew
    diffthis
endfunction
command DiffThis call DiffThis()

