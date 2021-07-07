" -------------------------------------------------------------------------
" Create a command for either python 2 or 3, depending on what is available
" on the platform.
" -------------------------------------------------------------------------
let g:_vimtodopy=":py3 "
if !has("python3")
   if !has("python")
       echo  "vim-todo requires Python 2 or 3."
       unlet g:_vimtodopy
   endif
   let g:_vimtodopy=":py "
endif

"
" This function parses the current buffer into an xml,
" and then displays it as a pretty print xml.
"
function! PrettyXml()
exec g:_vimtodopy "\n
\import xml.dom.minidom\n
\import vim\n
\\n
\buffer = vim.current.buffer\n
\\n
\content = '\\n'.join(buffer.range(1, len(buffer)))\n
\\n
\xml = xml.dom.minidom.parseString(content.strip())\n
\pretty_xml = xml.toprettyxml()\n
\\n
\buffer[:] = pretty_xml.splitlines()\n"
set filetype=xml
endfunction

"
" This function parses the current buffer as a JSON
" and displays is using a pretty print.
"
function! PrettyJson()
exec g:_vimtodopy "\n
\from json.tool import json as js\n
\import vim\n
\\n
\buffer = vim.current.buffer\n
\\n
\content = '\\n'.join(buffer.range(1, len(buffer)))\n
\data = js.dumps(js.loads(content.strip()), indent=2)\n
\\n
\buffer[:] = data.splitlines()\n"
set filetype=json.javascript
StripWhitespace
endfunction

"
" This function sends the current buffer into html-beautify.
" Install: npm install -g js-beautify
"
function! PrettyHtml()
%!html-beautify
set filetype=html
endfunction

"
" This function sends the current buffer into html-beautify.
" Install: npm install -g js-beautify
"
function! PrettyJs()
%!js-beautify
set filetype=javascript
endfunction

"
" This function sends the current buffer into html-beautify.
" Install: npm install -g js-beautify
"
function! PrettyCss()
%!css-beautify
set filetype=css
endfunction

" Command for pretty format XMLs and JSON
command PrettyXml call PrettyXml()
command PrettyJson call PrettyJson()
command PrettyHtml call PrettyHtml()
command PrettyCss call PrettyCss()
command PrettyJs call PrettyJs()

