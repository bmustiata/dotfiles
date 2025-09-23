#!/usr/bin/env python

import click
import subprocess
import textwrap


@click.command()
@click.option("--version", "-v",
              help="Version to download. ie. 24.4.2",
              default="<none>")
@click.option("--branch", "-b",
              help="Developer branch to download the helmchart for. ie. master (default)",
              default="master")
def main(version: str, branch: str) -> None:
    if version != "<none>":
        depman_download = textwrap.dedent(f"""\
        ~/bin/ae/depman-download.py --lifecycle-entity HELM --delivery Install.HELM_Automic --version {version} -o out.zip
        """)
    else:
        depman_download = textwrap.dedent(f"""\
        ~/bin/ae/depman-download.py --lifecycle-entity HELM --delivery Install.HELM_Automic --branch {branch} -o out.zip
        """)

    command = textwrap.dedent(f"""\
      set -e
      set -x
      {depman_download}
      unzip out.zip
      rm -f out.zip README.md NOTICE.txt automic-automation-plugin-*.tgz
    """)

    subprocess.check_call(["/bin/sh", "-c", command])


if __name__ == "__main__":
    main()

