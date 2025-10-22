" -------------------------------------------------------------------------
" Convert an XML to UC4 script
" -------------------------------------------------------------------------
function! XmlToUc4()

python3 << endpython
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
python3 << endpython
import xml.etree.ElementTree as ET

for i in range(len(vim.current.range)):
    line = vim.current.range[i].strip()
    element = ET.Element("OT_CONTENT")
    element.text = line
    vim.current.range[i] = ET.tostring(element, encoding='utf-8', method='xml')\
        .decode('utf-8')\
        .replace("<OT_CONTENT />", "<OT_CONTENT></OT_CONTENT>")

endpython
endfunction

command! -range XmlToUc4 <line1>,<line2>call XmlToUc4()
command! -range Uc4ToXml <line1>,<line2>call Uc4ToXml()

