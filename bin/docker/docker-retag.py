#!/usr/bin/env python3

import adhesive
from adhesive import Token, UI

import re

TAG_EXTRACTOR = re.compile(r'^(.+?)(\:(.+))?$')


class Image:
    def __init__(self, image_name: str) -> None:
        m = TAG_EXTRACTOR.match(image_name)

        if not m:
            raise Exception(f"Unable to parse image name {image_name}")

        self.image = m.group(1)
        self.tag = m.group(3) if m.group(3) else "latest"


class Data:
    registry_name: str
    username: str
    password: str
    old_image: str
    new_image: str


@adhesive.usertask('Image Registry Data')
def ask_image_registry_data(context: Token[Data], ui: UI):
    ui.add_input_text("registry_name",
                      value="isl-dsdc.ca.com:5000")
    ui.add_input_text("username", value="musbo01")
    ui.add_input_password("password", value="")
    ui.add_input_text("old_image")
    ui.add_input_text("new_image")


@adhesive.task('Retag Image {old_image} -> {new_image}')
def retag_image(context: Token[Data]):
    content_type = "application/vnd.docker.distribution.manifest.v2+json"
    registry_name = context.data.registry_name
    old = Image(context.data.old_image)
    new = Image(context.data.new_image)

    username = context.data.username
    password = context.data.password

    context.workspace.run(f"""
        MANIFEST_LOCATION=$(tempfile)
        PUSHLOG_FILE=$(tempfile)

        curl -u "{username}:{password}" -H "Accept: {content_type}" \\
            "https://{registry_name}/v2/{old.image}/manifests/{old.tag}" > $MANIFEST_LOCATION
        cat $MANIFEST_LOCATION
        (curl -X PUT -u "{username}:{password}" -H "Content-Type: {content_type}" --data-binary "@$MANIFEST_LOCATION" "https://{registry_name}/v2/{new.image}/manifests/{new.tag}" > $PUSHLOG_FILE) || true
        rm $MANIFEST_LOCATION

        cat $PUSHLOG_FILE
    """)


adhesive.build()
