"
" Asciidoc
"
function! AsciiDocFile()
    set filetype=asciidoc
    set fo=n
    nmap J ggVGP:ReplaceLinks<cr>:w<cr>
endfunction


" this function formats code that I can write in grammarly and paste in bulk
" into vim.
" some shortcuts are supported to include:
" images: Image path.to.image[description].   # description is optional
" source: Include cpp path.to.src.
" line  : sh: ls -la
" link  : text(http://...)

function! ReplaceLinks()
python3 << endpython

import re
import vim
import titlecase
from os import path

IMAGE_RE = re.compile(r"Image ((.*?)(\[(.*)\])?)\.$")
INCLUDE_RE = re.compile(r"Include ((\w+) )?(.*)\.$")
SOURCE_LINE = re.compile(r"^([a-z]+)\: (.*)$")
LINK_RE = re.compile(r"([\w\d]+)\((http.*?)\)")

# replace images
for i in range(len(vim.current.buffer)):
    line = vim.current.buffer[i]
    m = IMAGE_RE.match(line)

    if not m:
        continue

    vim.current.buffer[i] = "image:%s[%s]" % (m.group(2), m.group(4) if m.group(4) else m.group(2))

# replace source includes
i = 0
while i < len(vim.current.buffer):
    line = vim.current.buffer[i]
    m = INCLUDE_RE.match(line)

    if not m:
        i += 1
        continue

    vim.current.buffer[i:i+1] = [
      "[source,%s]" % (m.group(2).lower() if m.group(2) else "python"),
      "--------------------------------------------------------------------------",
      "include::/documents/%s" % m.group(3),
      "--------------------------------------------------------------------------",
    ]
    i += 4

# replace the source lines
i = 0
while i < len(vim.current.buffer):
    line = vim.current.buffer[i]
    m = SOURCE_LINE.match(line)

    if not m:
        i += 1
        continue

    vim.current.buffer[i:i+1] = [
      "[source,%s]" % m.group(1),
      "--------------------------------------------------------------------------",
      "%s" % m.group(2),
      "--------------------------------------------------------------------------",
    ]
    i += 4


# replace the links
i = 0
while i < len(vim.current.buffer):
    line = vim.current.buffer[i]
    m = LINK_RE.search(line)

    while m:
        vim.current.buffer[i] = line[:m.start()] + \
            "link:%s[%s]" % (m.group(2), m.group(1)) + \
            line[m.end():]
        line = vim.current.buffer[i]
        m = LINK_RE.search(line)

    i += 1


# update the title from the file name
file_name = vim.current.buffer.name
title = titlecase.titlecase(path.splitext(path.basename(file_name))[0].replace("_", " "))
vim.current.buffer[0:0] = [
    "= %s" % title,
    "",
]
endpython
endfunction

command ReplaceLinks call ReplaceLinks()

function! AsciidocToMarkdown()
    %s/\v\[source,(\w+)\]\n-+/```\1/g
    %s/\v-{3,1000}/```/g

    %s/^=====/#####/g
    %s/^====/####/g
    %s/^===/###/g
    %s/^==/##/g
    %s/^=/#/g
endfunction

command AsciidocToMarkdown call AsciidocToMarkdown()


au BufRead,BufNewFile *.adoc call AsciiDocFile()
au BufRead,BufNewFile *.ad call AsciiDocFile()

