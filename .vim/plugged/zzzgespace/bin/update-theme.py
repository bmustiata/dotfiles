#!/usr/bin/env python3

import os
from typing import List


def main() -> None:
    """
    Concat a bunch of files into a single vim file
    """
    content = read_initial_lines("../colors/gespace.vim")

    add_all_files_from(content, "../colors/_parts")
    add_all_files_from(content, "../ftplugin")

    write_content_lines("../colors/gespace.vim", content)


def read_initial_lines(file_name: str) -> List[str]:
    """
    Read the initial lines until the: DO NOT EDIT AFTER LINE
    """
    content = []

    with open(relative_path("../colors/gespace.vim"), 'r', encoding='utf-8') as f:
        lines = f.readlines()

    for line in lines:
        line = line.rstrip()
        content.append(line)

        if line == '" ------------------------------------------- DO NOT EDIT AFTER LINE ------':
            break

    return content


def add_all_files_from(content: List[str], path: str) -> None:
    """
    Add all the files from the given path to the content
    """
    files = os.listdir(relative_path(path))
    files.sort()
    for fname in files:
        append_file_content(content, relative_path(path, fname))


def append_file_content(content: List[str], file_name: str) -> None:
    """
    Append the content of the given filename to the full content
    that will be written at the end.
    """
    print(f"appending {file_name}")
    content.append(f'" > {file_name}')
    with open(file_name, 'r', encoding='utf-8') as f:
        content.extend(map(lambda x: x.rstrip(), f.readlines()))


def write_content_lines(relative_file_name: str, content: List[str]):
    with open(relative_path(relative_file_name), 'wt', encoding='utf-8') as f:
        f.write("\n".join(content))

    print("updated theme in gespace.vim")


def relative_path(path: str, file_name: str = "") -> str:
    return os.path.abspath(
        os.path.join(
            os.path.dirname(__file__),
            path,
            file_name,
        )
    )


if __name__ == "__main__":
    main()
