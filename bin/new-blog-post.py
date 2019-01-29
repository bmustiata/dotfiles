#!/usr/bin/env python3

from typing import List, Dict, Set

import argparse
import textwrap
import datetime
import subprocess
import os

SITE_LOCATION = "/tmp/x"
IMAGE_LOCATION = "assets/img/posts"


# selecting a tag will automatically pick its dependents
# the map of tags is defined in germanium-site/tags.mm
AVAILABLE_TAGS: Dict[str, List[str]] = {
    "germanium-api": ["germanium"],
    "germanium": ["selenium"],
    "germanium-drivers": ["germanium", "webdriver"],
    "germanium-selectors": ["germanium", "selenium-selectors"],
    "jenkins": ["devops"],
    "docker": ["devops"],
    "kubernetes": ["devops"],
    "germanium-selector-builder": ["germanium-selectors"],
    "selenium-selectors": ["selenium"],
    "webdriver": ["selenium"],
    "selenium-grid": ["selenium", "devops"],
    "python-development": ["development"],
    "java-development": ["development"],
    "integration-testing": ["testing"],
    "automated-test": ["testing"],
    "felix-build-monitor": ["jenkins"],
}

CURL_COMMAND = 'curl -s {url} | grep pexels-photo | grep fm=jpg | grep " download>" | cut -f2 -d\\" | head -n1'
WGET_COMMAND = "wget '{url}' -O '{file_name}'"


def get_image_url(image_page: str) -> str:
    return subprocess.check_output(['bash', '-c', CURL_COMMAND.format(url=image_page)])\
        .decode('utf-8')\
        .strip()


def get_title(args) -> str:
    if isinstance(args.title, str):
        return args.title

    return " ".join(args.title)


def generate_tags(tags_str: str) -> str:
    tags_to_process = list(tags_str.split(','))
    processed_tags: Set[str] = set()
    resolved_tags = list()

    for tag in tags_to_process:
        if tag in processed_tags:
            continue

        resolved_tags.append(tag)

        for dependent_tag in AVAILABLE_TAGS.get(tag, []):
            if dependent_tag not in processed_tags:
                tags_to_process.append(dependent_tag)

    return "\n".join([f"- {tag}" for tag in resolved_tags])


def generate_article(args, image_name):
    tags = generate_tags(args.tags)
    template = textwrap.dedent("""\
        title: {title}
        date: {date}
        tags:
        {tags}
        category: {category}
        lede: |
            LEDE CONTENT
        # thumbnail should be: 1280x720
        thumbnail: /assets/img/posts/{image_name}
        ---

        ++++
        <div class="image-strip">
        <img src="/assets/img/posts/{image_name}">
        </div>
        ++++

        == {title}

        LEDE CONTENT

        # photo taken from {image_url}
    """).format(
        title=get_title(args),
        date=args.date,
        tags=tags,
        category=args.category,
        image_url=args.image,
        image_name=image_name,
    )

    return template


def get_image_name(args) -> str:
    title = args.title.replace(" ", "-")
    return f"{args.date}-{title}.jpg"


def display_available_tags() -> None:
    available_tags = set()

    for k, v in AVAILABLE_TAGS.items():
        available_tags.add(k)
        for item in v:
            available_tags.add(item)

    print(available_tags)


def download_image(args) -> str:
    image_url = get_image_url(args.image)
    image_name = get_image_name(args)
    path = f"/tmp/{image_name}"

    subprocess.check_call([
        "bash",
        "-c",
        WGET_COMMAND.format(
            url=image_url,
            file_name=path
        )
    ])

    return path


def resize_image_to_blog_size(args, image_path: str) -> str:
    image_name = os.path.basename(image_path)
    output_path = os.path.join(SITE_LOCATION, IMAGE_LOCATION, image_name)

    subprocess.check_call([
        "blog-photo.sh",
        image_path,
        output_path,
    ])

    print(f"{image_path} -> {output_path}")

    return image_name


def main():
    """ Generate a new blog post """
    current_date = datetime.datetime.today().strftime('%Y-%m-%d')

    parser = argparse.ArgumentParser(description="Create new blog post")
    parser.add_argument('-i', '--image')
    parser.add_argument('-t', '--tags')
    parser.add_argument('-c', '--category')
    parser.add_argument('-d', '--date', default=current_date)
    parser.add_argument('--available-tags', action='store_true')
    parser.add_argument('title', nargs='*')

    args = parser.parse_args()
    args.title = " ".join(args.title)

    if args.available_tags:
        display_available_tags()
        exit(0)

    if not args.tags:
        raise Exception("You need to pass in tags")

    if not args.image:
        raise Exception("You need to pass in an image")

    local_image = download_image(args)
    image_name = resize_image_to_blog_size(args, local_image)

    print(generate_article(args, image_name))


if __name__ == '__main__':
    main()

