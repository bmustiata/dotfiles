#!/usr/bin/env python3

from typing import List, Generator, Dict

import click
import os
import re

from xml.etree import ElementTree as ET


MODULE_RE = re.compile('^.*?(\$MODULE_DIR\$[^"]+).*$')



@click.command()
@click.option("--project-folder", "--folder",
              help="Where the .idea folder is",
              default=".")
@click.option("--home-folder",
              help="The home folder of the user. If unset, it's read from the environment.")
def main(project_folder: str, home_folder: str) -> None:
    """
    Patch the modules.xml and workspace.xml from IDEA so it can correctly read
    the eclipse projects
    """
    for iml_file in find_all_iml_files(project_folder):
        print(f"processing: {iml_file}")
        patch_iml_file(home_folder, project_folder, iml_file)


def find_all_iml_files(project_folder: str) -> Generator[str, None, None]:
    """
    Finds all the iml files under the current folder
    """
    for dirname, dirnames, files in os.walk(project_folder):
        for file in files:
            if file.endswith(".iml"):
                yield os.path.join(dirname, file)


def patch_iml_file(home_folder, project_folder: str, iml_file: str) -> None:
    """
    Patches the iml file
    """
    links_dict = read_eclipse_links(iml_file)
    print(f"links: {links_dict}")
    iml_file_lines = read_file_lines(iml_file)

    processed_file_lines = process_file_lines(home_folder, iml_file_lines, links_dict)
    write_file_lines(iml_file, processed_file_lines)


def read_eclipse_links(iml_file: str) -> Dict[str, str]:
    """
    Returns a parsed links list from the corresponding eclipse .project
    definition file
    """
    result: Dict[str, str] = dict()

    # the project should be in the same folder as the iml file
    abs_iml_file = os.path.abspath(iml_file)
    eclipse_project_name = os.path.abspath(os.path.join(abs_iml_file, "../.project"))

    # parse XML
    root = ET.parse(eclipse_project_name)

    for p in root.findall('.//linkedResources/link'):
        name = p.find('name').text          # type: ignore
        location = p.find('location').text  # type: ignore
        link_type = p.find('type').text     # type: ignore
        assert name
        assert location
        assert link_type == "2"
        result[name] = location

    return result


def read_file_lines(file: str) -> List[str]:
    """
    Reads all the lines of the file
    """
    with open(file, 'rt', encoding='utf-8') as f:
        return f.readlines()


def process_file_lines(home_folder: str, lines: List[str], links_dict: Dict[str, str]) -> List[str]:
    """
    Processes all the lines from the IDEA iml file, and returns the new
    content that should be persisted.
    """
    result = []
    for line in lines:
        processed_line = process_line(home_folder, line, links_dict)
        result.append(processed_line)

    return result


def process_line(home_folder: str, line: str, links_dict: Dict[str, str]) -> str:
    """
    Processes the current line, resolving $MODULE_DIR$ and $USER_HOME$ folders
    """
    result = line

    if '$USER_HOME$' in result:
        result = result.replace('$USER_HOME$', home_folder.replace('\\', '/'))

    m = MODULE_RE.match(line)
    if m:
        links_key = m.group(1)[len('$MODULE_DIR$/'):]
        if links_key in links_dict:
            result = result.replace(m.group(1), links_dict[links_key])

    return result


def write_file_lines(iml_file: str, lines: List[str]) -> None:
    """
    Write all the lines into the file
    """
    with open(iml_file, 'wt', encoding='utf-8') as f:
        f.writelines(lines)


if __name__ == "__main__":
    main()
