from typing import Optional, List

import os
import os.path
import requests
import subprocess
import sys
import stat
import re


def AppImage(
        *,
        name: str,
        url: str,
        version: str = "",
        target: str = os.environ["HOME"] + "/programs",
    ) -> None:

    if not os.path.isdir(target):
        raise Exception(f"{target} is not a folder")

    existing_version = get_existing_app_version(target=target, name=name)

    if existing_version != version:
        print(f"Mismatch between existing version {existing_version} and {version}.")

    if existing_version != version:
        print(f"Downloading version {version}")
        download_app(
                name=name,
                url=url,
                version=version,
                target=target,
                make_executable=True)

    if existing_version and existing_version != version:
        print(f"Removing old version: {existing_version}")
        remove_existing_app(target=target, name=name, version=existing_version)

    execute_app(target=target, name=name, version=version)


def JarExecutable(
        *,
        name: str,
        url: str,
        version: str = "",
        target: str = os.environ["HOME"] + "/programs",
    ) -> None:

    if not os.path.isdir(target):
        raise Exception(f"{target} is not a folder")

    existing_version = get_existing_app_version(target=target, name=name, suffix=".jar")

    if existing_version != version:
        print(f"Mismatch between existing version {existing_version} and {version}.")

    if existing_version != version:
        print(f"Downloading version {version}")
        download_app(
                name=name,
                url=url,
                version=version,
                target=target,
                suffix=".jar")

    if existing_version and existing_version != version:
        print(f"Removing old version: {existing_version}")
        remove_existing_app(target=target, name=name, version=existing_version, suffix=".jar")

    execute_app(
        command_prefix = ["java", "-jar"],
        target=target,
        name=name,
        version=version,
        suffix=".jar"
    )



def get_existing_app_version(
        *,
        target: str,
        name: str,
        suffix: str = "") -> Optional[str]:
    """
    Finds out if the application is already present on the system,
    and if yes with what version.
    """
    for item in os.listdir(target):
        if item.startswith(name + "-") and item.endswith(suffix):
            return item[len(name) + 1: -len(suffix)]

    return None


VERSION_EXTRACTOR = re.compile(r"^(.+?)(\.(.+?)\.(.*)?)?$")

def download_app(
        *,
        name: str,
        url: str,
        version: str,
        target: str,
        suffix: str = "",
        make_executable: bool=False) -> None:
    m = VERSION_EXTRACTOR.match(version)

    target_url = url.format(
            version=version,
            version_1=m.group(1),
            version_2=m.group(1) + '.' + m.group(3) if m.group(3) else m.group(1),
    )
    output_file = os.path.join(target, f"{name}-{version}{suffix}")

    print(f"Downloading {target_url} as {output_file}")

    response = requests.get(target_url, allow_redirects=True)
    with open(output_file, "wb") as f:
        f.write(response.content)

    if make_executable:
        chmod_plus_x(output_file)


def chmod_plus_x(
        path: str) -> None:
    current_permissions = stat.S_IMODE(os.lstat(path).st_mode)
    os.chmod(path, current_permissions | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)


def remove_existing_app(
        *,
        target: str,
        name: str,
        version: str,
        suffix: str
    ) -> None:
    full_path = os.path.join(target, f"{name}-{version}{suffix}")
    os.remove(full_path)


def execute_app(*,
        command_prefix: List[str] = [],
        target: str,
        name: str,
        version: str,
        suffix: str = "") -> None:
    full_path = os.path.join(target, f"{name}-{version}{suffix}")
    subprocess.call([
        *command_prefix, full_path, *sys.argv
    ])

