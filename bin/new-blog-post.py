#!/usr/bin/env python3

from typing import List, Dict, Set
import click
from titlecase import titlecase

import argparse
import textwrap
import datetime
import os
import subprocess

SITE_LOCATION = "/home/raptor/projects/germanium-site"
IMAGE_LOCATION = "source/assets/img/posts"


# selecting a tag will automatically pick its dependents
# the map of tags is defined in germanium-site/tags.mm
AVAILABLE_TAGS: Dict[str, List[str]] = {
    "germanium": ["selenium"],
        "germanium-api": ["germanium"],
        "germanium-drivers": ["germanium", "webdriver"],
        "germanium-selectors": ["germanium", "selenium-selectors"],
    "devops": [],
        "jenkins": ["devops"],
        "docker": ["devops"],
        "kubernetes": ["devops"],
        "automation": ["devops"],
        "ansible": ["devops"],
        "security": ["devops"],
        "adhesive": ["devops", "jenkins"],
    "germanium-selector-builder": ["germanium-selectors"],
    "selenium": [],
        "selenium-selectors": ["selenium"],
        "webdriver": ["selenium"],
        "selenium-grid": ["selenium", "devops"],
    "development": [],
        "python-development": ["development"],
        "javascript-development": ["development"],
        "java-development": ["development"],
        "ide": ["development"],
            "eclipse": ["ide", "java-development"],
            "vim": ["ide"],
        "command-line": ["development", "devops"],
        "xslt": ["development"],
    "testing": [],
        "integration-testing": ["testing"],
        "automated-test": ["testing"],
        "accessibility-testing": ["testing"],
    "felix-build-monitor": ["jenkins"],
    "desktop": [],
        "gnome": ["desktop"],
    "release": [],
}

AVAILABLE_CATEGORIES = (
    "Tutorial",
    "Opinion",
    "News",
)

CURL_COMMAND = 'curl {url} | grep "fm=jpg" | grep "_blank" | grep js-photo-page-image-download-link | head -n1 | perl -pe "s/^.*href=\\\'(.*?)\\\'.*$/\\1/"'
# CURL_COMMAND = 'curl {url} | grep pexels-photo | grep fm=jpg | grep " download" | head -n1 | perl -pe "s/^.*href=\\"(.*?)\\".*$/\\1/"'
WGET_COMMAND = "wget '{url}' -O '{file_name}'"


def get_image_url(image_page: str) -> str:
    curl = CURL_COMMAND.format(url=image_page)

    print(curl)
    result = subprocess.check_output(['bash', '-c', curl])\
        .decode('utf-8')\
        .strip()

    print("url: " + result)

    return result


def generate_tags(tags_str: str) -> str:
    tags_to_process = list(tags_str.split(','))
    processed_tags: Set[str] = set()
    resolved_tags = list()

    for tag in tags_to_process:
        if tag in processed_tags:
            continue

        if tag not in AVAILABLE_TAGS:
            raise Exception(f"Tag '{tag}' not found in available tags: {AVAILABLE_TAGS.keys()}")

        processed_tags.add(tag)
        resolved_tags.append(tag)

        for dependent_tag in AVAILABLE_TAGS.get(tag, []):
            if dependent_tag not in processed_tags:
                tags_to_process.append(dependent_tag)

    # we need the spacing to match the dedent identation in `generate_article`
    return "\n        ".join([f"- {tag}" for tag in resolved_tags])


def generate_article(*, title, category, tags, date, image_name, image_url):
    tags = generate_tags(tags)

    template = textwrap.dedent(f"""\
        title: "{title}"
        date: {date}
        tags:
        {tags}
        category: {category}
        lede: |
            LEDE CONTENT
        # thumbnail should be: 1280x720
        thumbnail: "/assets/img/posts/{image_name}"
        ---

        ++++
        <div class="image-strip">
        <img src="/assets/img/posts/{image_name}">
        </div>
        ++++

        == {title}

        LEDE CONTENT

        [small]#_Article Photo from Pexels:_ {image_url}#
    """)

    return template


def get_image_name(date, title) -> str:
    image_title = title.replace(" ", "-")
    return f"{date}-{image_title}.jpg"


def display_available_tags() -> None:
    available_tags = set()

    for k, v in AVAILABLE_TAGS.items():
        available_tags.add(k)
        for item in v:
            available_tags.add(item)

    print(available_tags)


def display_available_categories() -> None:
    print(AVAILABLE_CATEGORIES)


def download_image(date: str, image: str, title: str) -> str:
    # if it's a regular file don't download it
    if image.startswith("/"):
        return image

    image_url = get_image_url(image)
    image_name = get_image_name(date, title)
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


def resize_image_to_blog_size(image_path: str) -> str:
    image_name = os.path.basename(image_path)
    output_path = os.path.join(SITE_LOCATION, IMAGE_LOCATION, image_name)

    print(f"blog-photo.sh {image_path} {output_path}")
    subprocess.check_call([
        "blog-photo.sh",
        image_path,
        output_path,
    ])

    print(f"{image_path} -> {output_path}")

    return image_name


current_date = datetime.datetime.today().strftime('%Y-%m-%d')


def edit_article(article_name: str) -> None:
    """
    Open the editor
    """
    subprocess.check_call([
        os.environ.get("EDITOR", "vim"),
        article_name,
    ])


@click.command()
@click.option('-i', '--image')
@click.option('-t', '--tags')
@click.option('-c', '--category')
@click.option('-d', '--date', default=current_date)
@click.option('--available-tags', is_flag=True)
@click.option('--available-categories', is_flag=True)
@click.argument('title', nargs=-1)
def main(title, image, tags, category, date, available_tags, available_categories):
    """ Generate a new blog post """
    title = titlecase(" ".join(title))

    if available_tags:
        display_available_tags()
        exit(0)

    if available_categories:
        display_available_categories()
        exit(0)

    if category not in AVAILABLE_CATEGORIES:
        raise Exception(f"Category can be only one of {AVAILABLE_CATEGORIES}")

    local_image = download_image(date, image, title)
    image_name = resize_image_to_blog_size(local_image)

    article_name = f"{SITE_LOCATION}/source/_posts/{date}-{title.replace(' ', '-').replace('(', '').replace(')', '')}.adoc"

    with open(article_name, "w") as f:
        f.write(generate_article(
            title = title,
            category = category,
            tags = tags,
            date = date,
            image_url=image,
            image_name=image_name
        ))

    print(article_name)
    edit_article(article_name)

if __name__ == '__main__':
    main()

