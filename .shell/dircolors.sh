# you need to source this into your .bashrc file:
# > source $HOME/.shell/dircolors.sh

# FIXME: move to 24bit colors
update_lscolors() {
    if [[ "$GESPACE_THEME" == "dark" ]]; then
        local file_color="fi=38;2;228;228;228"          #e4e4e4  #white
        local executable_color="ex=38;2;88;225;86"      #56E156  #green4
        local directory_color="di=38;2;82;164;200;1"    #FFA035  #blue4
        local link_color="ln=38;2;255;181;98;3"         #FF8700  #brown4
        local pipe_color="pi=38;5;215;3"
        local so_color="so=38;5;215;3"
        local block_device_color="bd=38;2;255;53;53;3"  #FF3535  #red3
        local char_device_color="cd=38;2;255;98;98"     #FF6262  #red4
        local or_color="or=38;5;160;3"
        local mi_color="mi=38;5;160"
    else # not [[ "$GESPACE_THEME" == "light" ]]
        local file_color="fi=38;5;235"
        local executable_color="ex=38;5;28;1"
        local directory_color="di=38;5;23;1"
        local link_color="ln=38;5;31;3"
        local pipe_color="pi=38;5;130;3"
        local so_color="so=38;5;130;3"
        local block_device_color="bd=38;5;130"
        local char_device_color="cd=38;5;130"
        local or_color="or=38;5;203;3"
        local mi_color="mi=38;5;203";
    fi   # else [[ "$GESPACE_THEME" == "light" ]]

    LS_COLORS="$file_color:$executable_color:$directory_color:$link_color:$pipe_color:$so_color:$block_device_color:$char_device_color:$or_color:$mi_color"
    export LS_COLORS
}

update_lscolors
