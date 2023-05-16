#!/usr/bin/env python3


import apps


apps.ZippedBinary(
    name="keystore-explorer",
    url="https://github.com/kaikramer/keystore-explorer/releases/download/v{version}/kse-{version_major}{version_minor}{version_patch}.zip",
    version="5.5.2",
    executable="kse-{version_major}{version_minor}{version_patch}/kse.sh",
)


