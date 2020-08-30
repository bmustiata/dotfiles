from typing import Optional, List

import os
import os.path
import requests
import subprocess
import sys
import stat
import re
import shutil
import click


def AppImage(
        *,
        name: str,
        url: str,
        version: str = "") -> None:
    app_definition(
        name=name,
        version=version,
        url=url,
    )


def JarExecutable(
        *,
        name: str,
        url: str,
        version: str = "") -> None:
    app_definition(
        command_prefix = ["java", "-jar"],
        name=name,
        version=version,
        url=url,
        suffix=".jar",
    )


def ZippedBinary(
    name: str,
    url: str,
    executable: str,
    version: str = "") -> None:
    app_definition(
        name=name,
        version=version,
        url=url,
        executable=executable,
        archive="zip",
    )


def ZippedJarExecutable(
    name: str,
    url: str,
    executable: str,
    version: str = "") -> None:

    app_definition(
        command_prefix = ["java", "-jar"],
        name=name,
        version=version,
        url=url,
        executable=executable,
        archive="zip",
    )


def app_definition(
        *,
        command_prefix: List[str] = [],
        target: str = os.environ["HOME"] + "/programs",
        name: str,
        url: str,
        version: str,
        suffix: str = "",
        archive: str = "",
        executable: str = "") -> None:
    if not os.path.isdir(target):
        raise Exception(f"{target} is not a folder")

    existing_version = get_existing_app_version(target=target, name=name, suffix=suffix)

    if existing_version != version:
        print(f"Mismatch between existing version {existing_version} and {version}.")

    if existing_version != version:
        print(f"Downloading version {version}")
        download_app(
                name=name,
                url=url,
                version=version,
                target=target,
                suffix=suffix,
                archive=archive,
                executable=executable)

    if existing_version and existing_version != version:
        print(f"Removing old version: {existing_version}")
        remove_existing_app(target=target, name=name, version=existing_version, suffix=suffix)

    execute_app(
        command_prefix=command_prefix,
        target=target,
        name=name,
        version=version,
        suffix=suffix,
        executable=executable,
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
            if not suffix:
                return item[len(name)+1:]

            return item[len(name) + 1: -len(suffix)]

    return None


VERSION_EXTRACTOR = re.compile(r"^(.+?)(\.(.+?)\.(.*)?)?$")

def download_app(
        *,
        name: str,
        url: str,
        version: str,
        target: str,
        archive: str,
        executable: str,
        suffix: str = "",
        make_executable: bool=False) -> None:
    target_url = version_format(url, version)

    if archive:
        download_file = os.path.join("/tmp", f"{name}-{version}{suffix}.{archive}")
    else:
        download_file = os.path.join(target, f"{name}-{version}{suffix}")

    print(f"Downloading {target_url} as {download_file}")

    response = requests.get(target_url, allow_redirects=True, stream=True)
    total_length = response.headers.get('content-length')

    if not total_length:
        print("Unknown remote file size")
        with open(download_file, "wb") as f:
            f.write(response.content)
    else:
        with click.progressbar(length=int(total_length), label=f"{download_file}") as bar:
            with open(download_file, "wb") as f:
                for data in response.iter_content(chunk_size=4096):
                    f.write(data)
                    bar.update(len(data))

    if make_executable and not archive:
        chmod_plus_x(download_file)

    if not archive:
        return

    output_folder = os.path.join(target, f"{name}-{version}{suffix}")
    shutil.rmtree(output_folder, ignore_errors=True)
    os.mkdir(output_folder)

    subprocess.check_call([
        "unzip", "-d", output_folder, download_file
    ])

    target_executable = version_format(executable, version)

    if make_executable:
        chmod_plus_x(os.path.join(output_folder, target_executable))


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
    shutil.rmtree(full_path)


def execute_app(*,
        command_prefix: List[str] = [],
        target: str,
        name: str,
        version: str,
        executable: str,
        suffix: str = "") -> None:

    if executable:
        target_executable = version_format(executable, version)
        full_path = os.path.join(target, f"{name}-{version}{suffix}", target_executable)
    else:
        full_path = os.path.join(target, f"{name}-{version}{suffix}")

    subprocess.call([
        *command_prefix, full_path, *sys.argv[1:]
    ])


def version_format(s: str, version: str) -> str:
    m = VERSION_EXTRACTOR.match(version)

    return s.format(
            version=version,
            version_1=m.group(1),
            version_2=m.group(1) + '.' + m.group(3) if m.group(3) else m.group(1),
    )


