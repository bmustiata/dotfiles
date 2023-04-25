BYOBU_LIGHT="\#e4e4e4"
BYOBU_DARK="\#034d6d"
BYOBU_ACCENT="\#52a4c8"
BYOBU_HIGHLIGHT="\#52a4c8"
MONOCHROME=

# in here we just abuse the color map so all we have is the dark
# blue and white for all the plugins.
color_map() {
        case "$1" in
                # "k") _RET="black" ;;
                "k") _RET="\#121212" ;;
                # "r") _RET="red" ;;
                "r") _RET="\#ae0000" ;;
                # "g") _RET="green" ;;
                "g") _RET="\#008b00" ;;
                # "y") _RET="yellow" ;;
                "y") _RET="\#e4e4e4" ;;
                # "b") _RET="blue" ;;
                "b") _RET="\#034d6d" ;;
                # "m") _RET="magenta" ;;
                "m") _RET="\#034d6d" ;;
                # "c") _RET="cyan" ;;
                "c") _RET="\#de0000" ;;
                # "w") _RET="white" ;;
                "w") _RET="\#034d6d" ;;
                # "d") _RET="black" ;;
                "d") _RET="\#121212" ;;
                # "K") _RET="brightblack" ;;
                "K") _RET="\#034d6d" ;;
                # "R") _RET="brightred" ;;
                "R") _RET="\#ff3535" ;;
                # "G") _RET="brightgreen" ;;
                "G") _RET="\#56e156" ;;
                # "Y") _RET="brightyellow" ;;
                "Y") _RET="\#e4e4e4" ;;
                # "B") _RET="brightblue" ;;
                "B") _RET="\#52a4c8" ;;
                # "M") _RET="brightmagenta" ;;
                "M") _RET="\#034d6d" ;;
                # "C") _RET="brightcyan" ;;
                "C") _RET="\#ff6262" ;;
                # "W") _RET="brightwhite" ;;
                "W") _RET="\#e4e4e4" ;;
                # *) _RET= ;;
                *) _RET= ;;
        esac
}

