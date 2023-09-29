au BufRead,BufNewFile *.xml set filetype=X_xml.xml
au BufRead,BufNewFile compare*.xml set filetype=compare_xml.X_xml.xml
au BufRead,BufNewFile pom.xml set filetype=X_pom.X_xml.xml

function! XmlPom()
    if &filetype =~ 'X_pom'
        let l:newType = substitute(&filetype, 'X_pom\.', '', '')
    else
        let l:newType =  'X_pom.' . &filetype
    endif

    execute 'set filetype=' . l:newType
endfunction
command XmlPom call XmlPom()
