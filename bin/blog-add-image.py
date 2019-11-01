#!/usr/bin/env python3
import click
import shutil
import os

from datetime import datetime
now = datetime.now()

sources_location = "/home/raptor/projects/germanium-site/source"


def mkdirp(path):
    os.makedirs(path, exist_ok=True)


def get_date_as_string() -> str:
    return now.strftime("%Y-%m-%d")


@click.command()
@click.argument("image")
@click.option("--description",
              help="Description of the image to use",
              default="description")
@click.option("--image-name",
              help="Image name to use instead of the original name")
@click.option("--postfix",
              help="Postfix of the folder to add (i.e. 2019-10-10-{postfix})")
def main(image, description, image_name, postfix) -> None:
    folder_name = get_date_as_string()
    if postfix:
        folder_name = f"{folder_name}-{postfix}"

    if not image_name:
        image_name = os.path.basename(image)

    mkdirp(f"{sources_location}/assets/img/posts/{folder_name}")


    shutil.copyfile(image, f"{sources_location}/assets/img/posts/{folder_name}/{image_name}")
    print(f"image:/assets/img/posts/{folder_name}/{image_name}[{description}]")


if __name__ == '__main__':
    main()

