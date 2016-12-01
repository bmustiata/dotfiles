"
" Associate Infinica files with XML
au BufRead,BufNewFile *.ipd set filetype=ipd_xml.X_xpath.X_xml.xml
au BufRead,BufNewFile *.itx set filetype=itx_xml.X_xpath.X_xml.xml
au BufRead,BufNewFile *.idx set filetype=idx_xml.X_xpath.X_xml.xml

au BufRead,BufNewFile compareProcessesConfig.xml set filetype=compareProcessesConfig.xml

au BufRead,BufNewFile .metadata.xml set filetype=InfinicaWorkplaceLaunchConfigurationFolder.X_xml.xml

function! LaunchConfiguration()
    set filetype=InfinicaWorkplaceLaunchConfiguration.X_xml.xml
endfunction
command LaunchConfiguration call LaunchConfiguration()

