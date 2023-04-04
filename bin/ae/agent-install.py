#!/usr/bin/env python

from typing import Optional, Dict, List, Tuple
import os.path
import re
import click
import shutil
import requests
import tempfile
from tqdm import tqdm
import zipfile
import tarfile
import ssl
import socket
import glob


LOCAL_TEMP_FOLDER="/tmp/downloads/"
NUMERIC_HOTFIX_PARSER_RE = re.compile(r'\+hf\.(\d+)')
URL_RE = re.compile(r'^(.*)://([A-Za-z0-9\-\.]+)(:[0-9]+)?(.*)$')

ROOT_SECTION = "<root>"
INI_WRITE_VAR_DEF = re.compile(r"^\[(.+)\]\.(.+)$")  # [SECTION].key
INI_SECTION_RE = re.compile(r"^\[(.+)\]$")           # [SECTION]
INI_VARIABLE_RE = re.compile(r"^([^;](.*?))=(.*)$")  # key=value


class AutomicIniSection:
    def __init__(self, section_name: str) -> None:
        self.name = section_name
        self.variables: Dict[str, int] = dict()  # a dict containing where the vars are defined
        self.lines: List[str] = []

    def add_line(self, line: str) -> None:
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


class ClientDefinition:
    def __init__(self, definition: str) -> None:
        self.definition = definition


class AgentInstallArgs:
    def __init__(self, **kw) -> None:
        self.bin_folder: str = kw["bin_folder"]
        self.agent_version: str = kw["agent_version"]
        self.target_folder: str = os.path.abspath(kw["target_folder"])
        self.jcp: str = kw["jcp"]
        self.cp: str = kw["cp"]
        self.agent_name: str = kw["agent_name"]
        self.system_name: str = kw["system_name"]
        self.agent_port: str = kw["agent_port"]
        self.zip_file: str = kw["zip_file"]
        self.depman_delivery_name: str = kw["depman_delivery_name"]
        self.agent_platform: str = kw["agent_platform"]
        self.client_0: ClientDefinition = ClientDefinition(kw["client_0"])
        self.client_100: ClientDefinition = ClientDefinition(kw["client_100"])
        self.exact_version: bool = kw["exact_version"]
        self.only_config: bool = kw["only_config"]
        self.windows: bool = kw["windows"]


default_bin_folder = "bin"
default_agent_version = "21.0.5"
default_jcp = "7YXK0Z2:8443"
default_cp = "<none>"
default_agent_name = "UNIX01"
default_system_name = "AUTOMIC"
default_agent_port = "<detect>"
default_zip_file = ""
default_target_folder = "."
default_client_0 = "0/UC/UC/UC"
default_client_100 = "100/CD/CD/CD"
default_delivery_name = "Agent_Unix_Linux"
default_agent_platform = "unix/linux"
default_exact_version = False
default_platform_folder = False


# cp /pd01/stg/release/AE/21.0.5/+hf.1/Automation.Engine_Agent_Unix_Linux_21_0_5+hf.1.build.1678471799591.zip .
@click.command()
@click.option("--agent-version", "--version", "-v",
              help=f"Specify the agent version to install from depman ({default_agent_version})",
              default=default_agent_version)
@click.option("--jcp", "-jcp",
              help=f"JCP address ({default_jcp})",
              default=default_jcp)
@click.option("--cp", "-cp",
              help=f"CP address. If this is present the CP will be used instead of the JCP ({default_cp})",
              default=default_cp)
@click.option("--agent-name", "--name", "-n",
              help=f"The name of the agent on the system ({default_agent_name})",
              default=default_agent_name)
@click.option("--system-name",
              help=f"Automic system name ({default_system_name})",
              default=default_system_name)
@click.option("--agent-port",
              help=f"The agent port to use ({default_agent_port})",
              default=default_agent_port)
@click.option("--zip-file", "--zip", "-z",
              help=f"Don't download the agent, but use instead the zip file with the given name ({default_zip_file})")
@click.option("--client-0", "-c-0",
              help=f"Client 0 ({default_client_0})",
              default=default_client_0)
@click.option("--client-100", "-c-100",
              help=f"Client 100 ({default_client_100})",
              default=default_client_100)
@click.option("--depman-delivery-name",
              help=f"What delivery to use from depman when fetching the agent ({default_delivery_name})",
              default=default_delivery_name)
@click.option("--agent-platform", "--platform",
              help=f"What platform to use for installation (namely the subarchive selection). This is a subpath inside of the main archive that must match ({default_agent_platform}).",
              default=default_agent_platform)
@click.option("--bin-folder",
              help="bin folder where the binaries of the agent are supposed to be installed",
              default=default_bin_folder)
@click.option("--exact-version", "--exact", is_flag=True, default=default_exact_version,
              help=f"Use the exact version, don't download the latest hotfix available ({default_exact_version})")
@click.option("--only-config", "--config", "-c", is_flag=True, default=False,
              help="Only run the configuration steps, it assumes everything is unpacked already in the target folder")
@click.option("--windows", is_flag=True, default=default_platform_folder,
              help="Assume the files are already unpacked in the archive, so use the platform just a subfolder (for Windows agents)")
@click.argument("target_folder", default=default_target_folder, nargs=1)
def main(**kw):
    args = AgentInstallArgs(**kw)

    absolute_target_folder = os.path.abspath(args.target_folder)
    print(f"target folder: {absolute_target_folder}")

    if args.only_config:
        patch_the_config(args)
        return

    if not args.zip_file:
        args.zip_file = get_temp_file_path(args)
        ensure_agent_is_downloaded(args)

    unpack_agent_into_folder(args)
    patch_the_config(args)


def ensure_agent_is_downloaded(args: AgentInstallArgs) -> str:
    """
    Downloads the agent locally on the disk. Returns the filename
    that's stored locally.
    """
    if is_already_downloaded(args):
        print(f"Zip used for agent: {args.zip_file}")
        return args.zip_file

    os.makedirs(os.path.dirname(args.zip_file), exist_ok=True)
    download_remote_file(args)

    print(f"Downloaded zip: {args.zip_file}")
    return args.zip_file


def unpack_agent_into_folder(args: AgentInstallArgs) -> None:
    os.makedirs(args.target_folder, exist_ok=True)

    temp_folder = tempfile.mkdtemp()

    try:
        unzip_file_into_folder(args, temp_folder)
        target_subarchive = find_subarchive_matching_platform(args, temp_folder)

        if args.windows:
            copy_files(target_subarchive, f"{args.target_folder}/{args.bin_folder}")
            return

        untargz_file_into_folder(target_subarchive, args.target_folder)
    finally:
        shutil.rmtree(temp_folder)


def copy_files(src_folder: str, dest_folder: str) -> None:
    """
    Copies all the files from the source folder into the destination folder
    """
    shutil.copytree(src_folder, dest_folder, dirs_exist_ok=True)


def find_subarchive_matching_platform(args: AgentInstallArgs, temp_folder: str) -> str:
    """
    Finds the correct agent that we're supposed to install
    """
    if args.windows:
        for root, dirs, files in os.walk(temp_folder):
            for name in dirs:
                full_name = os.path.join(root, name)
                if args.agent_platform in full_name:
                    return full_name

        raise Exception(f"unable to find {args.agent_platform} in {temp_folder}: {files}")

    files = glob.glob(f"{temp_folder}/**/*.tar.gz", recursive=True)
    for file in files:
        if args.agent_platform in file:
            print(f"using subarchive {file} for platform {args.agent_platform}")
            return file

    raise Exception(f"unable to find {args.agent_platform} in {temp_folder}: {files}")


def patch_the_config(args: AgentInstallArgs) -> None:
    download_the_certificate(args)
    open_port = find_an_available_port(args)
    patch_ini_file(args, open_port)


def download_the_certificate(args: AgentInstallArgs) -> None:
    """
    Download the certificate from the JCP connection
    """
    if args.cp != default_cp:
        print(f"agent configured to use old CP {args.cp} so no certificate needs to be downloaded")
        return

    certs_folder = os.path.join(args.target_folder, args.bin_folder, "certs")
    os.makedirs(certs_folder, exist_ok=True)
    cert_file_name = os.path.join(certs_folder, "server.pem")

    cert_config = (get_hostname(args.jcp), get_port(args.jcp))
    print(f"downloading {cert_config[0]}:{cert_config[1]} certificate as {cert_file_name}")
    content = ssl.get_server_certificate(cert_config)
    with open(cert_file_name, 'wt', encoding='utf-8') as f:
        f.write(content)


def find_an_available_port(args: AgentInstallArgs) -> int:
    if args.agent_port != default_agent_port:
        print(f"using passed agent port: {args.agent_port}")
        return int(args.agent_port)

    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        for port in range(2100, 3217):
            result = sock.connect_ex(('127.0.0.1', port))

            if result != 0:
                print(f"found available port for agent: {port}")
                return port

        raise Exception("no open port found")
    finally:
        sock.close()


def patch_ini_file(args: AgentInstallArgs, available_port: int) -> None:
    """
    Configures the ini file of the agent, so it can connect to the given
    AE server.
    """
    ini_filename = ensure_ini_file_exists(args)
    INI_PROPERTIES = {
        "[GLOBAL].name": args.agent_name,
        "[GLOBAL].system": args.system_name,
        "[GLOBAL].login_check": "yes",
        "[AUTHORIZATION].trustedCertFolder": "certs",  # bin/certs inside the agent
        "[TCP/IP].port": str(available_port),
    }

    if args.cp != default_cp:
        INI_PROPERTIES["[TCP/IP].cp"] = args.cp
    else:
        jcp_host_port = get_hostname(args.jcp) + ":" + str(get_port(args.jcp))
        INI_PROPERTIES["[TCP/IP].connection"] = jcp_host_port

    change_ini_properties(ini_filename, INI_PROPERTIES)


def ensure_ini_file_exists(args: AgentInstallArgs) -> str:
    """
    Ensures the ini file exists
    """
    agent_binary_name = find_agent_binary_name(args)
    ini_file_name = get_ini_file_name(args, agent_binary_name)

    if os.path.isfile(ini_file_name):
        return ini_file_name

    ori_ini_file_name = find_ori_ini_file_name(args)

    shutil.copyfile(ori_ini_file_name, ini_file_name)

    return ini_file_name


def find_agent_binary_name(args: AgentInstallArgs) -> str:
    """
    Finds the binary executable name of the agent.
    """
    found_files: List[str] = os.listdir(os.path.join(args.target_folder, args.bin_folder))
    for f in found_files:
        if f.endswith("6m"):
            return f[0:-1]

        if f.endswith("64m"):
            return f[0:-1]

        if f.endswith("6m.exe"):
            return f[0:-5]

    raise Exception(f"unable to find agent binary name looking in {args.target_folder}/{args.bin_folder}")


def get_ini_file_name(args: AgentInstallArgs, agent_binary_name: str) -> str:
    bin_folder = os.path.join(args.target_folder, args.bin_folder)
    ini_file_name = f"{agent_binary_name}.ini"

    for f in os.listdir(bin_folder):
        if f.lower() == ini_file_name.lower():
            return os.path.join(bin_folder, f)

    return os.path.join(bin_folder, ini_file_name)


def find_ori_ini_file_name(args: AgentInstallArgs) -> str:
    """
    Find the ori.ini file name in the bin folder
    """
    found_files: List[str] = os.listdir(os.path.join(args.target_folder, args.bin_folder))
    for f in found_files:
        if f.endswith(".ori.ini"):
            return os.path.join(args.target_folder, args.bin_folder, f)

    raise Exception(f"unable to find template ini file (????.ori.ini) in {args.target_folder}/{args.bin_folder}")


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


def get_hostname(url: str) -> str:
    """
    Extracts the hostname part
    """
    m = URL_RE.match(url)

    if not m:
        return url.split(":")[0]

    return m.group(2)


def get_port(url: str) -> int:
    """
    Extracts the port part from a host:port pair
    """
    m = URL_RE.match(url)

    if not m:
        url_tokens = url.split(":")
        if len(url_tokens) == 1:
            return 443

        return int(url_tokens[1])

    if m.group(3):
        return int(m.group(3))

    return 443 if m.group(1) == "https" else 80


def untargz_file_into_folder(targz_file: str, target_folder: str) -> None:
    with tarfile.open(targz_file) as f:
        f.extractall(target_folder)


def unzip_file_into_folder(args: AgentInstallArgs, temp_folder: str) -> None:
    with zipfile.ZipFile(args.zip_file, 'r') as zip_ref:
        zip_ref.extractall(temp_folder)


def is_already_downloaded(args: AgentInstallArgs) -> bool:
    return os.path.isfile(args.zip_file)


def download_remote_file(args: AgentInstallArgs) -> None:
    url = "http://depman.automic.com/jart/prj3/depman/interfaces/sledgehammer/helper/get_release_delivery.jart"

    depman_version = get_major_version(args)
    hotfix_number = get_hotfix_number(args)
    if hotfix_number:
        depman_version = f"{depman_version} HF{hotfix_number}"

    params = {
        "lifecycle_entity_technical_name": "AE",
        "version_string": depman_version,
        "delivery_name": args.depman_delivery_name,
    }

    if not args.exact_version:
        params["version_string"] = depman_version
    else:
        params["exact_version"] = depman_version

    response = requests.get(url, params=params, stream=True)
    response.raise_for_status()

    total_size_in_bytes= int(response.headers.get('content-length', 0))
    block_size = 8196
    progress_bar = tqdm(total=total_size_in_bytes, unit='iB', unit_scale=True)
    with open(args.zip_file, 'wb') as f:
        for data in response.iter_content(block_size):
            progress_bar.update(len(data))
            f.write(data)
    progress_bar.close()
    if total_size_in_bytes != 0 and progress_bar.n != total_size_in_bytes:
        print("ERROR, something went wrong")


def get_temp_file_path(args: AgentInstallArgs) -> str:
    if args.exact_version:
        full_temp_path = os.path.join(
            LOCAL_TEMP_FOLDER,
            f"{args.depman_delivery_name}_{args.agent_version}.zip",
        )
    else:
        major_version = get_major_version(args)
        full_temp_path = os.path.join(
            LOCAL_TEMP_FOLDER,
            f"{args.depman_delivery_name}_{major_version}-latest.zip",
        )

    return full_temp_path


def is_numeric(hotfix_part: str) -> bool:
    return NUMERIC_HOTFIX_PARSER_RE.match(hotfix_part) is not None


def get_hotfix_number(args: AgentInstallArgs) -> int:
    hotfix_part = get_hotfix_part(args.agent_version)
    m = NUMERIC_HOTFIX_PARSER_RE.match(hotfix_part)

    if not m:
        return 0

    return int(m.group(1))


def decrement_hotfix_part(hotfix_part: str) -> str:
    m = NUMERIC_HOTFIX_PARSER_RE.match(hotfix_part)

    if not m:
        raise Exception(f"not a hotfix-part: {hotfix_part}")

    hotfix_version = int(m.group(1))
    hotfix_version -= 1

    if hotfix_version == 0:
        return '+'

    return f'+hf.{hotfix_version}'


def get_major_version(args: AgentInstallArgs) -> str:
    return args.agent_version.split('+')[0]


def get_hotfix_part(agent_version: str) -> str:
    tokens = agent_version.split('+')
    if len(tokens) < 2:
        return "+"

    if len(tokens) > 2:
        raise Exception(f"invalid agent version `{agent_version}`")

    return "+" + tokens[1]


def get_file_from_folder(folder_name: str, file_pattern: str, agent_version: str) -> Optional[str]:
    try:
        for file_name in os.listdir(folder_name):
            if file_pattern in file_name:
                return os.path.join(folder_name, file_name)
    except FileNotFoundError:
        print(f"Folder for version {agent_version} doesn't exist in {folder_name}")

    print(f"{file_pattern} with version {agent_version} wasn't found in {folder_name}")

    return None


if __name__ == "__main__":
    main()

