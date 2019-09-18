" -------------------------------------------------------------------------
" Convert an XML to UC4 script
" -------------------------------------------------------------------------
function! XmlToUc4()

python << endpython
import vim
import xml.etree.ElementTree as ET

content = ""
for i in range(len(vim.current.range)):
    root_node = ET.fromstring(vim.current.range[i].strip())
    vim.current.range[i] = root_node.text if root_node.text else ""

endpython

set filetype=uc4

endfunction


" -------------------------------------------------------------------------
" Convert an UC4 script to XML with some nodes inbetween
" -------------------------------------------------------------------------
function! Uc4ToXml()
python << endpython

endpython
endfunction

command! -range XmlToUc4 <line1>,<line2>call XmlToUc4()
command! -range Uc4ToXml <line1>,<line2>call Uc4ToXml()

