# you need to source this into your .bashrc file:
# > source $HOME/.shell/dircolors.sh

if [[ "$GESPACE_THEME" == "dark" ]]; then
    LS_COLORS='fi=38;5;254:ex=38;5;77;1:di=38;5;31;1:ln=38;5;23:pi=38;5;215:so=38;5;215:bd=38;5;215;1:cd=38;5;215;1:or=38;5;160;1:mi=38;5;160';
else # not [[ "$GESPACE_THEME" == "light" ]]
    LS_COLORS='fi=38;5;235:ex=38;5;28;1:di=38;5;23;1:ln=38;5;31:pi=38;5;130:so=38;5;130:bd=38;5;130;1:cd=38;5;130;1:or=38;5;203;1:mi=38;5;203';
fi   # else [[ "$GESPACE_THEME" == "light" ]]

export LS_COLORS
