#!/usr/bin/env python3

from typing import List, Generator, Dict

import click
import os
import re
import os

from xml.etree import ElementTree as ET


MODULE_RE = re.compile('^.*?(\$MODULE_DIR\$[^"]+).*$')

# 1. eclipse: ./dev-build.sh run ae-workspaces/targets/java/install-operator --config=java17
# 2. idea import eclipse project (but don't open)
# 3. eclipse-idea-patch.py --folder /path/to/folder/with/.idea
# 4. open the IDEA project, add the module + change the sources types

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
    if not home_folder:
        home_folder = os.environ.get('HOME')

    for iml_file in find_all_iml_files(project_folder):
        print(f"processing: {iml_file}")
        patch_iml_file(home_folder, project_folder, iml_file)


def find_all_iml_files(project_folder: str) -> Generator[str, None, None]:
    """
    Finds all the iml files under the current folder
    """
    print(f"working in: {project_folder}")
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
    iml_file_document = ET.parse(os.path.abspath(iml_file))

    processed_file_lines = process_file_lines(home_folder, iml_file_document, links_dict)
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


def process_file_lines(home_folder: str,
                       root: ET,
                       links_dict: Dict[str, str]) -> List[str]:
    """
    Processes all the lines from the IDEA iml file, and returns the new
    content that should be persisted.
    """
    # 1. reparent all the sourceFolder to new content roots
    parent_map = {c:p for p in root.iter() for c in p}

    for p in root.findall('.//content'):
        content_parent = parent_map[p]

        # reparent the source folders to be each in a new <content> with the same URL
        for e in p.iter("sourceFolder"):
            new_content = ET.Element("content", attrib={"url": e.get("url")})
            new_content.append(e)
            content_parent.append(new_content)

            # e.remove(content_parent)
            # print(e)

        parent_map[p].remove(p)

        # patch the source nodes to have the correct types
        for e in p.iter("sourceFolder"):
            if "src/main/java" in e.get("url"):
                e.set("isTestSource", "false")
            if "src/test/java" in e.get("url"):
                e.set("isTestSource", "true")
            if "src/main/resource" in e.get("url"):
                e.set("type", "java-resource")
            if "src/test/resource" in e.get("url"):
                e.set("type", "java-test-resource")

    lines = ET.tostring(root.getroot(), encoding='utf8')\
                .decode('utf-8')\
                .split("\n")

    # 2. resolve aliases for $MODULE_DIR$ and $USER_HOME$
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
