set tabstop=4
set shiftwidth=4
set expandtab

" Allow working with tabs as actual tabs:
function! Tabs2()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal noexpandtab
endfunction
command Tabs2 call Tabs2()

function! Tabs4()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal noexpandtab
endfunction
command Tabs4 call Tabs4()

function! Tabs8()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal noexpandtab
endfunction
command Tabs8 call Tabs8()

function! Spaces2()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction
command Spaces2 call Spaces2()

function! Spaces4()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
endfunction
command Spaces4 call Spaces4()

function! Spaces8()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal expandtab
endfunction
command Spaces8 call Spaces8()

function! SpacesAll2()
    set tabstop=2
    set shiftwidth=2
    set expandtab
endfunction
command SpacesAll2 call SpacesAll2()

function! SpacesAll4()
    set tabstop=4
    set shiftwidth=4
    set expandtab
endfunction
command SpacesAll4 call SpacesAll4()

function! SpacesAll8()
    set tabstop=8
    set shiftwidth=8
    set expandtab
endfunction
command SpacesAll8 call SpacesAll8()

SpacesAll4

