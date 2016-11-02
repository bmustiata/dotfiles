"
" Associate Infinica files with XML
au BufRead,BufNewFile *.ipd set filetype=ipd_xml.xml
au BufRead,BufNewFile *.itx set filetype=itx_xml.xml
au BufRead,BufNewFile *.idx set filetype=idx_xml.xml

au BufRead,BufNewFile compareProcessesConfig.xml set filetype=compareProcessesConfig.xml

au BufRead,BufNewFile .metadata.xml set filetype=InfinicaWorkplaceLaunchConfigurationFolder.xml

function! LaunchConfiguration()
    set filetype=InfinicaWorkplaceLaunchConfiguration.xml
endfunction
command LaunchConfiguration call LaunchConfiguration()

