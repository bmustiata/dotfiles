" -------------------------------------------------------------------------
" A function that escapes the current text for properties
" -------------------------------------------------------------------------
function! UnicodeEncode()
python << endpython

import vim
import re

X_CHAR = re.compile(r'^(.*)\\x(..)(.*)$')

for i in range(len(vim.current.range)):
    encoded_a = vim.current.range[i]\
        .decode('utf-8')\
        .encode('unicode_escape')\
        .decode('latin1')

    m = X_CHAR.match(encoded_a)
    while m:
        encoded_a = m.group(1) + "\\u00" + m.group(2).upper() + m.group(3)
        m = X_CHAR.match(encoded_a)

    vim.current.range[i] = encoded_a

endpython
endfunction

" -------------------------------------------------------------------------
" A function that allows getting the escaped text, and convert it to
" UTF-8 text.
" -------------------------------------------------------------------------
function! UnicodeDecode()
python << endpython

import vim

for i in range(len(vim.current.range)):
    vim.current.range[i] = vim.current.range[i]\
        .encode('utf-8')\
        .decode('unicode_escape')

endpython
endfunction


command! -range UnicodeEncode <line1>,<line2>call UnicodeEncode()
command! -range UnicodeDecode <line1>,<line2>call UnicodeDecode()

