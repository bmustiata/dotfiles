#!/usr/bin/env python3

import apps


apps.StaticBinary(
    name="bazel",
    url="https://github.com/bazelbuild/bazel/releases/download/{version}/bazel-{version}-linux-x86_64",
    version="3.4.1",
    shortcut="/home/raptor/bin/bazel",
)

