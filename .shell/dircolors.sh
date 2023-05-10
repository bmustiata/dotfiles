# you need to source this into your .bashrc file:
# > source $HOME/.shell/dircolors.sh

update_ls_colors() {
    if [[ "$GESPACE_THEME" == "dark" ]]; then
        local file_color="fi=38;2;228;228;228"          ##e4e4e4  #white
        local executable_color="ex=38;2;88;225;86;1"    ##56E156  #green4
        local directory_color="di=38;2;82;164;200;1"    ##52A4C8  #blue4 bold
        local link_color="ln=38;2;8;129;181;3"          ##0881B5  #blue2 italic
        local pipe_color="pi=38;2;255;181;98;1"         ##FFB562  #brown4 bold
        local socket_color="so=38;2;255;181;98;1"       ##FFB562  #brown4 bold
        local block_device_color="bd=38;2;255;53;53;1"  ##FF3535  #red3 bold
        local char_device_color="cd=38;2;255;53;53"     ##FF3535  #red3
        local orphan_link_color="or=38;2;255;98;98;3"   ##FF6262  #red4 italic
        local missing_color="mi=38;2;255;98;98"         ##FF6262  #red4
    else # not [[ "$GESPACE_THEME" == "light" ]]
        local file_color="fi=38;2;18;18;18"             ##121212  #black
        local executable_color="ex=38;2;0;139;0;1"      ##008B00  #green0
        local directory_color="di=38;2;3;77;109;1"      ##034D6D  #blue0 bold
        local link_color="ln=38;2;3;77;109;3"           ##034D6D  #blue0 italic
        local pipe_color="pi=38;2;174;92;0;3"           ##AE5C00  #brown0 italic
        local socket_color="so=38;2;174;92;0;1"         ##AE5C00  #brown0 bold
        local block_device_color="bd=38;2;222;0;0;1"    ##DE0000  #red bold
        local char_device_color="cd=38;2;222;0;0"       ##DE0000  #red1
        local orphan_link_color="or=38;2;174;0;0;3"     ##AE0000  #red0 italic
        local mi_color="mi=38;2;174;0;0;3";             ##AE0000  #red0 italic
    fi   # else [[ "$GESPACE_THEME" == "light" ]]

    LS_COLORS="$file_color:$executable_color:$directory_color:$link_color:$pipe_color:$socket_color:$block_device_color:$char_device_color:$orphan_link_color:$mi_color"
    export LS_COLORS
}

update_ls_colors
