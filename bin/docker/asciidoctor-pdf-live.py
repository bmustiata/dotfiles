#!/usr/bin/env python3

import subprocess
import os
import sys

def main() -> None:
    project_folder = os.getcwd()
    uid = os.getuid()
    gid = os.getgid()

    monitored_folder = sys.argv[1]
    arguments = " ".join(list(sys.argv[2:]))

    subprocess.check_call([
        "flr", "-o", monitored_folder,
        "-e", f"docker run --rm -v {project_folder}:/documents -w /documents -u {uid}:{gid} bmst/docker-asciidoctor /usr/bin/asciidoctor-pdf -r asciidoctor-diagram {arguments}"])


if __name__ == '__main__':
    main()
