hi! link asciidocQuotedMonospaced2 GeConstant
hi! link asciidocMacro GeLink
hi! link asciidocMacroAttributes GeState
hi! link asciidocAttributeList GeComment
hi! link asciidocListingBlock GeComment
hi! link asciidocAdmonition GeSubTitleItalic
hi! link asciidocURL GeLink
hi! link asciidocCallout GeSubTitleItalic

function! AsciidocEnableSyntaxRanges()
" source block syntax highlighting
"          \, '\]\@<!\n[=-]\{4,\}\n'
if exists('g:loaded_SyntaxRange')
  for lang in ['c', 'python', 'javascript', 'cucumber', 'xml', 'typescript', 'sh', 'java', 'cpp', 'php', 'yaml', 'css', 'html', 'go', 'sql']
    call SyntaxRange#Include(
          \  '\c\[source\s*,\s*' . lang . '\s*\]\s*\n[=-]\{4,\}\n'
          \, '[=-]\{4,\}\n'
          \, lang, 'NonText')
  endfor

  call SyntaxRange#Include(
        \  '\c\[source\s*,\s*gherkin.*\]\s*\n[=-]\{4,\}\n'
        \, '\]\@<!\n[=-]\{4,\}\n'
        \, 'cucumber', 'NonText')

  call SyntaxRange#Include(
        \  '\c\[source\s*,\s*text.*\]\s*\n[=-]\{4,\}\n'
        \, '\]\@<!\n[=-]\{4,\}\n'
        \, 'plaintext', 'NonText')
endif
endfunction

" call AsciidocEnableSyntaxRanges()
command! AsciidocEnableSyntaxRanges call AsciidocEnableSyntaxRanges()
