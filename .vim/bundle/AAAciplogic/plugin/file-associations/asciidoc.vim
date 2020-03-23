"
" Asciidoc
"
function! AsciiDocFile()
    set filetype=asciidoc
    NextWordy
endfunction

function! ReplaceLinks()
python << endpython

import re
import vim

IMAGE_RE = re.compile(r"Image (.*)\.$")

for i in range(len(vim.current.buffer)):
    line = vim.current.buffer[i]
    m = IMAGE_RE.match(line)

    if not m:
        continue

    vim.current.buffer[i] = "image:/documents/%s.png[%s]" % (m.group(1), m.group(1))

endpython
endfunction

command ReplaceLinks call ReplaceLinks()

au BufRead,BufNewFile *.adoc call AsciiDocFile()
au BufRead,BufNewFile *.ad call AsciiDocFile()


