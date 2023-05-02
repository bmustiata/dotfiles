#!/usr/bin/env python

import os
import adhesive
from typing import Set, Any, Tuple
import semver
import textwrap
import shlex


class Data:
    cwd: str
    folder: str
    agent_version: str
    exact_version: Set[str]
    agent_name: str
    agent_os: str
    agent_port: str
    agent_platform: str
    zip_file: str


@adhesive.usertask('Select OS and Version')
def select_os_and_version(token: adhesive.Token[Data], ui) -> None:
    ui.add_input_text(name="folder", title="Folder", value=token.data.folder)
    ui.add_input_text(name="bin_folder", title="Bin Folder", value=token.data.bin_folder)
    ui.add_input_text(name="agent_version", title="Version", value=token.data.agent_version)
    ui.add_checkbox_group(name="exact_version", title="Exact Version", values=(("yes", "Yes"),))
    ui.add_input_text(name="agent_name", title="Agent Name", value=token.data.agent_name)
    ui.add_input_text(name="agent_port", title="Agent Port", value=token.data.agent_port)
    ui.add_input_text(name="zip_file", title="Zip File (empty to download)", value=token.data.zip_file)
    ui.add_combobox(name="agent_os", title="OS", values=("linux", "windows", "aix", "solaris"), value=token.data.agent_os)


@adhesive.usertask('Select Platform')
def select_platform(token: adhesive.Token[Data], ui) -> None:
    ui.add_readonly_text(title="Version", value=token.data.agent_version)
    ui.add_readonly_text(title="Exact Version", value="yes" if "yes" in token.data.exact_version else "no, use latest")
    ui.add_readonly_text(title="Agent Name", value=token.data.agent_name)
    ui.add_readonly_text(title="Agent Port", value=token.data.agent_port)
    ui.add_readonly_text(title="OS", value=token.data.agent_os)

    version = semver.VersionInfo.parse(token.data.agent_version)

    platforms: Any = None

    if token.data.agent_os == "linux":
        platforms = [
            "x64",
        ]
    elif token.data.agent_os == "windows":
        platforms = [
            "x64",
        ]
    elif token.data.agent_os == "aix":
        platforms = [
            ["/powerpc64/", "A64 Power-PC64"],
            ["/powerpc/", "AP6 Power-PC"],
        ]
    elif token.data.agent_os == "solaris":
        platforms = [
            ["/sparc64/", "U64 Sparc64"],
            ["/sparc/", "US8 Sparc"],
            ["/x86/", "UI8 Intel"],
            ["/x64/", "SI6 Intel 64-Bit (x64)"],
        ]

    if version.major >= 21 and token.data.agent_os in ("linux", "windows"):
        platforms.append("java")

    ui.add_combobox(name="agent_platform", title="Platform", values=platforms, value=platforms[0])

    ui.add_default_button(name="direction", title="Back", value="back")
    ui.add_default_button(name="direction", title="OK", value="forward")


@adhesive.usertask('AE Config')
def ae_config(token: adhesive.Token[Data], ui) -> None:
    ui.add_input_text(name="system_name", title="System", value="AUTOMIC")
    ui.add_input_text(name="jcp", title="JCP", value="7YXK0Z2:8443")
    ui.add_input_text(name="cp", title="CP", value="")

    ui.add_input_text(name="client_0_id", title="Client 0 ID", value="0")
    ui.add_input_text(name="client_0_user", title="User", value="UC")
    ui.add_input_text(name="client_0_dept", title="Dept", value="UC")
    ui.add_input_text(name="client_0_pass", title="Pass", value="UC")

    ui.add_input_text(name="client_100_id", title="Client 100 ID", value="100")
    ui.add_input_text(name="client_100_user", title="User", value="CD")
    ui.add_input_text(name="client_100_dept", title="Dept", value="CD")
    ui.add_input_text(name="client_100_pass", title="Pass", value="CD")

    ui.add_default_button(name="direction", title="Back", value="back")
    ui.add_default_button(name="direction", title="Only Config", value="config")
    ui.add_default_button(name="direction", title="Create", value="create")


@adhesive.task("Create Agent")
def create_agent(token: adhesive.Token[Data]) -> None:
    cp = shlex.quote("<none>") if not token.data.cp else token.data.cp
    agent_port = shlex.quote("<detect>") if not token.data.agent_port else token.data.agent_port

    only_config_flag = "--only-config" if token.data.direction == "config" else ""
    windows_flag = "--windows" if token.data.agent_os == "windows" else ""
    exact_version_flag = "--exact-version" if "yes" in token.data.exact_version else ""
    zip_file = f"--zip {token.data.zip_file}" if token.data.zip_file else ""

    depman_delivery_name, agent_platform = detect_delivery_and_platform(token.data)

    token.workspace.run(textwrap.dedent(f"""\
        cd {token.data.cwd}
        /home/raptor/bin/ae/agent-install.py \\
                --agent-version {shlex.quote(token.data.agent_version)} \\
                --jcp {shlex.quote(token.data.jcp)} \\
                --cp {cp} \\
                --agent-name {shlex.quote(token.data.agent_name)} \\
                --system-name {shlex.quote(token.data.system_name)} \\
                --agent-port {shlex.quote(agent_port)} \\
                --client-0 {token.data.client_0_id}/{token.data.client_0_user}/{token.data.client_0_dept}/{token.data.client_0_pass} \\
                --client-100 {token.data.client_100_id}/{token.data.client_100_user}/{token.data.client_100_dept}/{token.data.client_100_pass} \\
                --depman-delivery-name {shlex.quote(depman_delivery_name)} \\
                --agent-platform {shlex.quote(agent_platform)} \\
                {zip_file} \\
                {exact_version_flag} {only_config_flag} {windows_flag} \\
                --bin-folder {shlex.quote(token.data.bin_folder)} \\
                {shlex.quote(token.data.folder)}
    """))


def detect_delivery_and_platform(data: Data) -> Tuple[str, str]:
    """
    Detects the depman delivery name + eventual platform (path to search)
    """
    version = semver.VersionInfo.parse(data.agent_version)

    if data.agent_os == "linux":
        if data.agent_platform == "java":
            if version.major >= 23:
                return ("Agent_Unix_Linux", "java")
            else:
                return ("Agent_Unix_Linux-java", "java")

        return ("Agent_Unix_Linux", "unix/linux/x64")

    if data.agent_os == "aix":
        return ("Agent_Unix_aix", data.agent_platform)

    if data.agent_os == "solaris":
        return ("Agent_Unix_Solaris", data.agent_platform)

    if data.agent_os == "windows":
        if data.agent_platform == "java":
            if version.major >= 23:
                return ("Agent_Windows", "java")
            else:
                return ("Agent_Windows-Java", "java")

        return ("Agent_Windows", "x64")

    raise Exception(f"unknown OS to install: {data.agent_os}")


def main():
    bpmn_file = os.path.join(os.path.dirname(__file__), "agent-install-ui.bpmn")
    adhesive.bpmn_build(bpmn_file, initial_data={
        "cwd": os.path.abspath(os.curdir),
        "folder": "./",
        "bin_folder": "bin",
        "agent_version": "21.0.5",
        "agent_name": "UNIX01",
        "agent_os": "linux",
        "agent_port": "2301",
        "zip_file": "",
    })

if __name__ == "__main__":
    main()

