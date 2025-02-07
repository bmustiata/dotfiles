#!/usr/bin/env python3

from typing import Tuple
import requests
import click
import json
import base64
import re

DOCKER_IMAGE = re.compile(r"^([^/]+)/?([^:]+):?(.+?)$")


@click.command()
@click.argument("image_name", nargs=1)
def main(image_name: str) -> None:
    image_server = get_image_registry_server(image_name)
    auth = get_user_credentials_from_docker_config(image_server)

    image_metadata_url = get_image_metadata_url(image_name)

    image_hash = get_image_hash(image_metadata_url, auth)

    print(image_hash)


def get_image_registry_server(image_name: str) -> str:
    """
    Return the image registry server for the given image name
    """
    server, _, _ = parse_docker_image_name(image_name)
    return server


def get_user_credentials_from_docker_config(image_server: str) -> str:
    """
    Returns the user/pass for the given image_server
    """
    with open("/home/raptor/.docker/config.json", 'r', encoding='utf-8') as f:
        data = json.load(f)

    return data['auths'][image_server]['auth']


def get_image_metadata_url(image_name: str) -> str:
    server, path, tag = parse_docker_image_name(image_name)
    return f"https://{server}/v2/{path}/manifests/{tag}"


def get_image_hash(image_metadata_url: str, auth: str) -> str:
    headers = {
        "accept": "application/vnd.docker.distribution.manifest.v2+json",
        "authorization": f"Basic {auth}",
    }
    r = requests.head(image_metadata_url, headers=headers)
    r.raise_for_status()

    print(r.headers)

    return r.headers['Docker-Content-Digest']


def parse_docker_image_name(image_name: str) -> Tuple[str, str, str]:
    m = DOCKER_IMAGE.match(image_name)

    if not m:
        raise Exception(f"Unable to parse {image_name}")

    server = m.group(1)
    path = m.group(2)
    tag = m.group(3)

    return server, path, tag


if __name__ == "__main__":
    main()
