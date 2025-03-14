#!/usr/bin/env python3

from typing import Dict, List, Tuple
import click
import re


INI_WRITE_VAR_DEF = re.compile(r"^\[(.+)\]\.(.+)$")  # [SECTION].key
INI_SECTION_RE = re.compile(r"^\[(.+)\]$")           # [SECTION]
INI_VARIABLE_RE = re.compile(r"^([^;](.*?))=(.*)$")  # key=value


class AutomicIniSection:
    def __init__(self, section_name: str) -> None:
        self.name = section_name
        self.variables: Dict[str, int] = dict()  # a dict containing where the vars are defined
        self.lines: List[str] = []

    def add_line(self, line: str) -> None:
        line = line.rstrip() + "\n"
        if not self._is_variable_definition(line):
            self.lines.append(line)
            return

        variable_name = self._get_variable_name(line)
        self.variables[variable_name.lower()] = len(self.lines)
        self.lines.append(line)

    def update_value(self, key: str, value: str) -> None:
        if key.lower() in self.variables:
            line_no = self.variables[key.lower()]
            variable_name = self._get_variable_name(self.lines[line_no])
            self.lines[line_no] = f"{variable_name}={value}\n"
            return

        self.variables[key.lower()] = len(self.lines)
        self.lines.append(f"{key}={value}\n")

    def _is_variable_definition(self, line: str) -> bool:
        """
        Checks if the given line is a variable definition, ie.
        system=AUTOMIC
        """
        return INI_VARIABLE_RE.match(line) is not None

    def _get_variable_name(self, line: str) -> str:
        m = INI_VARIABLE_RE.match(line)

        if not m:
            raise Exception(f"line containing variable definition has no variable name: {line}")

        return m.group(1)


class AutomicIni:
    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        self.section_list: List[AutomicIniSection] = []
        self.sections: Dict[str, AutomicIniSection] = dict()

    @staticmethod
    def read_from_file(file_name: str) -> 'AutomicIni':
        result = AutomicIni(file_name)
        current_section = result.create_section("<root>")

        with open(file_name, 'rt', encoding='utf-8') as f:
            lines = f.readlines()

        for line in lines:
            if is_new_section(line):
                current_section = result.create_section(get_section_name(line))
                continue

            current_section.add_line(line)

        return result

    def create_section(self, section_name: str) -> AutomicIniSection:
        section = AutomicIniSection(section_name)

        if section_name.lower() in self.sections:
            raise Exception(f"section {section_name} already exists")

        self.section_list.append(section)
        self.sections[section_name.lower()] = section

        return section

    def set_value(self, section_name: str, key: str, value: str) -> None:
        section = self.sections[section_name.lower()]
        section.update_value(key, value)

    def write_to_file(self) -> None:
        with open(self.file_name, 'wt', encoding='utf-8') as f:
            for section in self.section_list:
                if section.name != "<root>":
                    f.write(f"[{section.name}]\n")

                for line in section.lines:
                    f.write(line)

def is_new_section(line: str) -> bool:
    """
    Checks if the line is the starting of a new section in the ini
    [GLOBAL], etc
    """
    return INI_SECTION_RE.match(line) is not None


def get_section_name(line: str) -> str:
    m = INI_SECTION_RE.match(line)

    if not m:
        raise Exception(f"{line} is not a valid section name")

    return m.group(1)


@click.command()
@click.option("--ini-file", "--ini", "-i",
              help="ini file to use, default ucsrv.ini",
              default="ucsrv.ini")
@click.argument("ini_values", nargs=-1) # help="format: [SECTION].param=abc"
def main(ini_file: str, ini_values: List[str]) -> None:
    """
    Patch the ini file with the given ini values
    """
    ini_properties = build_from_string_list(ini_values)
    change_ini_properties(ini_file, ini_properties)


def build_from_string_list(ini_values: List[str]) -> Dict[str, str]:
    """
    Creates the dictionary of the ini properties to change
    """
    result: Dict[str, str] = dict()

    for ini_value in ini_values:
        tokens = ini_value.split("=")
        key = tokens[0]
        value = "=".join(tokens[1:])

        result[key] = value

    return result


def change_ini_properties(ini_filename: str, ini_properties: Dict[str, str]):
    automic_ini = AutomicIni.read_from_file(ini_filename)

    for section_key, value in ini_properties.items():
        section, key = get_section_and_key(section_key)
        automic_ini.set_value(section, key, value)

    automic_ini.write_to_file()


def get_section_and_key(section_key: str) -> Tuple[str, str]:
    """
    Processes strings such as: [SECTION]key and returns them split
    in (SECTION, key) as a Tuple
    """
    m = INI_WRITE_VAR_DEF.match(section_key)

    if not m:
        raise Exception(f"unable to read section/key from {section_key}")

    return m.group(1), m.group(2)


if __name__ == "__main__":
    main()

