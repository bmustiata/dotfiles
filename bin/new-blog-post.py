#!/usr/bin/env python3

import argparse
import textwrap
import datetime

# selecting a tag will automatically pick its dependents
# the map of tags is defined in germanium-site/tags.mm
AVAILABLE_TAGS = {
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

CURL_COMMAND='curl https://www.pexels.com/photo/person-on-a-bridge-near-a-lake-747964/ | grep pexels-photo | grep fm=jpg | grep " download>" | cut -f2 -d\" | head -n1'


def get_title(args):
    if isinstance(args.title, str):
        return args.title

    return " ".join(args.title)


def generate_tags(tags_str):
    tags_to_process = list(tags_str.split(','))
    processed_tags = set()
    resolved_tags = list()

    for tag in tags_to_process:
        if tag in processed_tags:
            continue

        resolved_tags.append(tag)

        for dependent_tag in AVAILABLE_TAGS.get(tag, []):
            if dependent_tag not in processed_tags:
                tags_to_process.append(dependent_tag)

    return "\n".join([f"- {tag}" for tag in resolved_tags])


def generate_article(args):
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
        thumbnail: /assets/img/posts/{image}
        ---

        ++++
        <div class="image-strip">
        <img src="/assets/img/posts/{image}">
        </div>
        ++++

        == {title}

        LEDE CONTENT
    """).format(
        title=get_title(args),
        date=args.date,
        tags=tags,
        category=args.category,
        image=args.image
    )

    return template


def display_available_tags():
    available_tags = set()

    for k, v in AVAILABLE_TAGS.items():
        available_tags.add(k)
        for item in v:
            available_tags.add(item)

    print(available_tags)


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

    if args.available_tags:
        display_available_tags()
        exit(0)

    print(generate_article(args))


if __name__ == '__main__':
    main()
