#!/usr/bin/env python3

import enum
import os
import textwrap
import re
from typing import Union, Dict, Tuple, List


LIGHT_PALETTE: Dict[str, int] = {
    "GrayShade0": 15,  # #ffffff
    "GrayShade1": 254,  # #e4e4e4
    "GrayShade2": 252,  # #d0d0d0
    "GrayShade3": 242,  # #6c6c6c
    "GrayShade4": 238,  # #444444
    "GrayShade5": 242,  # #6c6c6c
    "GrayShade6": 238,  # #444444
    "GrayShade7": 235,  # #262626
    "GrayShade8": 0,  # #000000
    "GreenShade0": 28,  # #008700
    "GreenShade1": 34,  # #00af00
    "GreenShade2": 77,  # #5fd75f
    "BlueShade0": 23,  # #005f5f
    "BlueShade1": 24,  # #005f87
    "BlueShade2": 74,  # #5fafd7
    "BlueShade3": 31,  # #0087af
    "YellowShade0": 130,  # #af5f00
    "RedShade0": 124,  # #af0000
    "RedShade1": 160,  # #d70000
    "RedShade2": 203,  # #ff5f5f
    "RedShade3": 9,  # #ff0000
}


DARK_PALETTE: Dict[str, int] = {
    "GrayShade0": 0,  # #000000
    "GrayShade1": 235,  # #262626
    "GrayShade2": 238,  # #444444
    "GrayShade3": 242,  # #6c6c6c
    "GrayShade4": 248,  # #a8a8a8
    "GrayShade5": 250,  # #bcbcbc
    "GrayShade6": 252,  # #d0d0d0
    "GrayShade7": 254,  # #e4e4e4
    "GrayShade8": 15,  # #ffffff

    "GreenShade0": 77,  # #5fd75f
    "GreenShade1": 34,  # #00af00
    "GreenShade2": 28,  # #008700

    "BlueShade0": 31,  # #0087af
    "BlueShade1": 74,  # #5fafd7
    "BlueShade2": 24,  # #005f87
    "BlueShade3": 23,  # #005f5f

    "YellowShade0": 215,  # #ffaf5f

    "RedShade0": 9,  # #ff0000
    "RedShade1": 203,  # #ff5f5f
    "RedShade2": 160,  # #d70000
    "RedShade3": 124,  # #af0000
}


LSCOLORS_TEMPLATE = textwrap.dedent(
    """\
    # you need to source this into your .bashrc file:
    # > source $HOME/.shell/dircolors.sh

    if [[ "$GESPACE_THEME" == "dark" ]]; then
        LS_COLORS='{dark_colors}';
    else # not [[ "$GESPACE_THEME" == "light" ]]
        LS_COLORS='{light_colors}';
    fi   # else [[ "$GESPACE_THEME" == "light" ]]

    export LS_COLORS
"""
)


class FileType(enum.Enum):
    directory = "di"  # Directory
    regular = "fi"  # File
    link = "ln"  # Symbolic Link
    pipe = "pi"  # Fifo file
    socket = "so"  # Socket file
    block_device = "bd"  # Block (buffered) special file
    character_device = "cd"  # Character (unbuffered) special file
    orphan_link = "or"  # Symbolic Link pointing to a non-existent file (orphan)
    missing = "mi"  # Non-existent file pointed to by a symbolic link (visible when you type ls -l)
    executable = "ex"  # File which is executable (ie. has 'x' set in permissions).


GESPACE_PALETTE = {
    # gray
    FileType.regular: ("GrayShade7", ""),

    # green
    FileType.executable: ("GreenShade0", "bold"),

    # blue
    FileType.directory: ("BlueShade0", "bold"),
    FileType.link: ("BlueShade3", "italic"),

    # yellow
    FileType.pipe: ("YellowShade0", "italic"),
    FileType.socket: ("YellowShade0", "italic"),
    FileType.block_device: ("YellowShade0", "bold"),
    FileType.character_device: ("YellowShade0", "bold"),

    # red
    FileType.orphan_link: ("RedShade2", "italic"),
    FileType.missing: ("RedShade2", ""),
}


def main():
    light_colors, dark_colors = register_items()
    write_lscolors_sh(light_colors, dark_colors)


def register_items() -> Tuple[str, str]:
    color_tuples: List[Tuple[str, str]] = []

    # actual theme definition happens here:
    for item_type, palette_color in GESPACE_PALETTE.items():
        color_tuples.append(
            register_item(item_type, palette_color[0], font_type=palette_color[1])
        )

    light_colors = [it[0] for it in color_tuples]
    dark_colors = [it[1] for it in color_tuples]

    return ":".join(light_colors), ":".join(dark_colors)


def register_item(item_type, palette_color: str, font_type: str = "") -> Tuple[str, str]:
    light_color = register_color(item_type, LIGHT_PALETTE[palette_color], font_type=font_type)
    dark_color = register_color(item_type, DARK_PALETTE[palette_color], font_type=font_type)

    return (light_color, dark_color)


def register_color(
    item: Union[str, FileType],
    fg: int,
    font_type: str,
) -> str:
    """
    Register a single color
    """
    if isinstance(item, enum.Enum):
        item = item.value

    result = f"{item}=38;5;{fg}"

    # lame, but good enough for parsing
    if "bold" in font_type:
        result += ";1"

    if "italic" in font_type:
        result += ";3"

    if "underline" in font_type:
        result += ";4"

    if "strikethrough" in font_type:
        result += ";9"

    return result


def break_color(color: str) -> Tuple[int, int, int]:
    if color.startswith("#"):
        color = color[1:]

    result = [int(h, 16) for h in re.split(r"(..)(..)(..)", color)[1:4]]

    return result  # type: ignore


def write_lscolors_sh(light_colors: str, dark_colors: str) -> None:
    with open("dircolors.sh", "wt", encoding="utf-8") as f:
        content = LSCOLORS_TEMPLATE.format(
            light_colors=light_colors,
            dark_colors=dark_colors,
        )
        f.write(content)


if __name__ == "__main__":
    main()
