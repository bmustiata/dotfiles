"
" Asciidoc
"
function! AsciiDocFile()
    set filetype=asciidoc
endfunction

nmap J ggVGP:ReplaceLinks<cr>ggVGgqgg

function! ReplaceLinks()
python << endpython

import re
import vim

IMAGE_RE = re.compile(r"Image ((.*?)(\[(.*)\])?)\.$")
INCLUDE_RE = re.compile(r"Include (.*)\.$")

for i in range(len(vim.current.buffer)):
    line = vim.current.buffer[i]
    m = IMAGE_RE.match(line)

    if not m:
        continue

    vim.current.buffer[i] = "image:%s.png[%s]" % (m.group(2), m.group(4) if m.group(4) else m.group(2))

for i in range(len(vim.current.buffer)):
    line = vim.current.buffer[i]
    m = INCLUDE_RE.match(line)

    if not m:
        continue

    vim.current.buffer[i:i+1] = [
      "[source,python]",
      "--------------------------------------------------------------------------",
      "include::/documents/%s" % m.group(1),
      "--------------------------------------------------------------------------",
    ]
    i += 4

endpython
endfunction

command ReplaceLinks call ReplaceLinks()

au BufRead,BufNewFile *.adoc call AsciiDocFile()
au BufRead,BufNewFile *.ad call AsciiDocFile()

