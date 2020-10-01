#!/usr/bin/env python3


import apps


apps.TarGzBinary(
    name="insomnia",
    url="https://github.com/Kong/insomnia/releases/download/core%40{version}/Insomnia.Core-{version}.tar.gz",
    version="2020.4.1",
    executable="Insomnia.Core-{version}/insomnia",
)

