#!/usr/bin/env python

import os


gespace_theme = os.path.abspath(
    os.path.join(
        os.path.dirname(__file__),
        "../colors/gespace.vim",
    )
)

ftfiles_folder = os.path.abspath(
    os.path.join(
        os.path.dirname(__file__),
        "../ftplugin",
    )
)

content = []

with open(gespace_theme, 'r', encoding='utf-8') as f:
    lines = f.readlines()

for line in lines:
    line = line.rstrip()
    content.append(line)

    if line == '" ------------------------------------------- DO NOT EDIT AFTER LINE ------':
        break

for fname in os.listdir(ftfiles_folder):
    content.append(f'" > {fname}')
    with open(os.path.join(ftfiles_folder, fname), 'r', encoding='utf-8') as f:
        content.extend(map(lambda x: x.rstrip(), f.readlines()))

with open(gespace_theme, 'wt', encoding='utf-8') as f:
    f.write("\n".join(content))
