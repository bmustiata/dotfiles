function! VimEnableSyntaxRanges()
if exists('g:loaded_SyntaxRange')
  call SyntaxRange#Include(
        \  '^python << endpython$'
        \, '^endpython$'
        \, 'python', 'NonText')

endif
endfunction

call VimEnableSyntaxRanges()
command VimEnableSyntaxRanges call VimEnableSyntaxRanges()
