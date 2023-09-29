#!/usr/bin/env python

import requests
from tqdm import tqdm
import click
import re
import sys


NUMERIC_HOTFIX_PARSER_RE = re.compile(r'\+hf\.(\d+)')


class DepmanArgs:
    def __init__(self,
                 *,
                 depman_delivery_name: str,
                 exact_version: bool,
                 zip_file: str,
                 version: str,
                 only_print: bool,
                 ):
        self.depman_delivery_name = depman_delivery_name
        self.exact_version = exact_version
        self.zip_file = zip_file
        self.version = version
        self.only_print = only_print


def download_remote_file(args: DepmanArgs) -> None:
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

    if args.only_print:
        p = requests.Request('GET', url, params=params).prepare()
        print(p.url)
        sys.exit(0)

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


def get_major_version(args: DepmanArgs) -> str:
    return args.version.split('+')[0]


def get_hotfix_part(version: str) -> str:
    tokens = version.split('+')
    if len(tokens) < 2:
        return "+"

    if len(tokens) > 2:
        raise Exception(f"invalid agent version `{version}`")

    return "+" + tokens[1]


def get_hotfix_number(args: DepmanArgs) -> int:
    hotfix_part = get_hotfix_part(args.version)
    m = NUMERIC_HOTFIX_PARSER_RE.match(hotfix_part)

    if not m:
        return 0

    return int(m.group(1))


@click.command()
@click.option("--depman-delivery-name", "--delivery",
              help="Specify the delivery name to download")
@click.option("--exact-version", "--exact", is_flag=True, default=False,
              help="Use the exact version. Don't try to fetch the latest hotfix of the thing.")
@click.option("--zip-file", "--zip", "--out", "-o",
              help="Output file")
@click.option("--only-print", "--print", is_flag=True, default=False,
              help="Only print the URL to download from depman")
@click.option("--version", default="21.0",
              help="The version to download")
def main(depman_delivery_name: str,
         exact_version: bool,
         zip_file: str,
         version: str,
         only_print: bool) -> None:
    if not zip_file:
        zip_file = f"{depman_delivery_name}.zip"

    depman_args = DepmanArgs(
        depman_delivery_name=depman_delivery_name,
        exact_version=exact_version,
        zip_file=zip_file,
        version=version,
        only_print=only_print,
    )
    download_remote_file(depman_args)


if __name__ == "__main__":
    main()
