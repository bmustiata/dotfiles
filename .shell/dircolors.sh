# you need to source this into your .bashrc file:
# > source $HOME/.shell/dircolors.sh

if [[ "$GESPACE_THEME" == "dark" ]]; then
    LS_COLORS='fi=38;5;254:ex=38;5;77;1:di=38;5;31;1:ln=38;5;23;3:pi=38;5;215;3:so=38;5;215;3:bd=38;5;215;1:cd=38;5;215;1:or=38;5;160;3:mi=38;5;160';
else # not [[ "$GESPACE_THEME" == "light" ]]
    LS_COLORS='fi=38;5;235:ex=38;5;28;1:di=38;5;23;1:ln=38;5;31;3:pi=38;5;130;3:so=38;5;130;3:bd=38;5;130;1:cd=38;5;130;1:or=38;5;203;3:mi=38;5;203';
fi   # else [[ "$GESPACE_THEME" == "light" ]]

export LS_COLORS
