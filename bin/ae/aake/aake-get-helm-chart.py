#!/usr/bin/env python

import click
import subprocess
import textwrap


@click.command()
@click.option("--version", "-v",
              help="Version to download. ie. 4.4.2 (helmchart versions don't have the prefixing 2)",
              default="<none>")
@click.option("--branch", "-b",
              help="Developer branch to download the helmchart for. ie. master (default)",
              default="master")
@click.option("--exact", "-e", is_flag=True, default=False,
              help="Download the exact version of the helm chart.")
@click.option("--only-print", "--print", "-p", is_flag=True, default=False,
              help="Only print the depman URL")
def main(version: str, branch: str, exact: bool, only_print: bool) -> None:
    exact_flag = ""
    if exact:
        exact_flag = "--exact"

    if version != "<none>":
        depman_download = textwrap.dedent(f"""\
        ~/bin/ae/depman-download.py --lifecycle-entity HELM --delivery Install.HELM_Automic --version {version} -o out.zip {exact_flag}""")
    else:
        depman_download = textwrap.dedent(f"""\
        ~/bin/ae/depman-download.py --lifecycle-entity HELM --delivery Install.HELM_Automic --branch {branch} -o out.zip {exact_flag}""")

    if only_print:
        depman_download = f"{depman_download} --print"
        subprocess.check_call(["/bin/sh", "-c", depman_download])
        return

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

