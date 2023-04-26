BYOBU_LIGHT="\#e4e4e4"       # white
BYOBU_DARK="\#034D6D"        # blue0
BYOBU_ACCENT="\#2E90BB"      # blue3
BYOBU_HIGHLIGHT="\#2E90BB"   # blue3
MONOCHROME=

# in here we just abuse the color map so all we have is the dark
# blue and white for all the plugins.
color_map() {
        case "$1" in
                # "k") _RET="black" ;;
                "k") _RET="\#121212" ;;
                # "r") _RET="red" ;;
                "r") _RET="\##ae0000" ;;
                # "g") _RET="green" ;;
                "g") _RET="\#008b00" ;;
                # "y") _RET="yellow" ;;
                "y") _RET="\#ffa035" ;;
                # "b") _RET="blue" ;;
                "b") _RET="\#034d6d" ;;
                # "m") _RET="magenta" ;;
                "m") _RET="\#de0000" ;;
                # "c") _RET="cyan" ;;
                "c") _RET="\#05638c" ;;
                # "w") _RET="white" ;;
                "w") _RET="\#aaaaaa" ;;
                # "d") _RET="black" ;;
                "d") _RET="\#121212" ;;
                # "K") _RET="brightblack" ;;
                "K") _RET="\#777777" ;;
                # "R") _RET="brightred" ;;
                "R") _RET="\#ff0000" ;;
                # "G") _RET="brightgreen" ;;
                "G") _RET="\#56e156" ;;
                # "Y") _RET="brightyellow" ;;
                "Y") _RET="\#ffb562" ;;
                # "B") _RET="brightblue" ;;
                "B") _RET="\#52a4c8" ;;
                # "M") _RET="brightmagenta" ;;
                "M") _RET="\#ff6262" ;;
                # "C") _RET="brightcyan" ;;
                "C") _RET="\#2e90bb" ;;
                # "W") _RET="brightwhite" ;;
                "W") _RET="\#e4e4e4" ;;
                # *) _RET= ;;
                *) _RET= ;;
        esac
}

# vi ft=bash
