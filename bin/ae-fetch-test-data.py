#!/usr/bin/env python

from typing import Generator, Any

import click
import requests
import json
import os.path

# test client: 7777
#        user: TESTER_7777
#        pass: test123

@click.command()
@click.option("--server",
              help="The server to use (default: http://6KGNB54:8088)",
              default="http://6KGNB54:8088")
@click.option("--client",
              help="Client ID",
              default="100")
@click.option("--user",
              help="User name",
              default="CD")
@click.option("--password",
              help="Password",
              default="CD")
@click.option("--output-folder",
              help="Where to output the resources",
              default=".")
@click.option("--single", "-s", is_flag=True, default=False,
              help="When set download a single object with that given name")
@click.argument("folder", default="The server folder name to fetch (i.e. bugs/ABC-123) or object name if --single", nargs=1)
def main(server: str, client: str, user: str, password: str, output_folder: str, folder: str, single: bool):
    if single:
        data = fetch_single_object(server, client, folder, user, password)
    else:
        data = fetch_folder(server, client, folder, user, password)

    for item in data:
        object_type = get_object_type(item)
        if object_type == "fold":
            continue

        item["path"] = folder  # it seems the REST service returns only the last path
        write_object_to_file(output_folder, item, object_type)


def fetch_folder(server, client, folder, user, password) -> Any:
    SERVER_URL = f"{server}/ae/api/v1/{client}/folderobjects/{folder}"
    print(f"Fetching {SERVER_URL}")

    r = requests.get(
        SERVER_URL,
        auth=(user, password),
        verify=False,
    )

    r.raise_for_status()

    json_data = r.json()

    for item in json_data["data"]:
        yield item


def fetch_single_object(server, client, object_name, user, password) -> Any:
    SERVER_URL = f"{server}/ae/api/v1/{client}/objects/{object_name}"
    print(f"Fetching {SERVER_URL}")

    r = requests.get(
        SERVER_URL,
        auth=(user, password),
        verify=False,
    )

    r.raise_for_status()

    yield r.json()


def get_object_type(item) -> str:
    for k, v in item["data"].items():
        return k

    raise Exception(f"Unable to find object type for {item}")


def write_object_to_file(output_folder, item, object_type):
    object_name = item["data"][object_type]["general_attributes"]["name"]
    target_filename = os.path.join(output_folder, f"{object_name}.json")

    print(f"writing: {target_filename}")
    with open(target_filename, 'wt', encoding='utf-8') as f:
        json.dump(item, f, sort_keys=True, indent=2)

if __name__ == "__main__":
    main()
