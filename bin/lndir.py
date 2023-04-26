#!/usr/bin/env python3

import sys
import os
import textwrap
import errno
import logging

LOG = logging.getLogger(__name__)


files_to_skip = {
    ".git",
    ".hg",
    ".ssh",
    ".svn",
    ".mypy_cache",
    "plz-out",
    "__pycache__",
}
ignored_folder = None


def print_usage(custom_message):
    print(textwrap.dedent("""\
        Usage: lndir.py source_folder target_folder

        %s
    """ % custom_message))


def link_file(source_path, target_path):
    if os.path.islink(target_path):
        if os.path.realpath(target_path) == os.path.realpath(source_path):
            return

        os.remove(target_path)

    if os.path.exists(target_path):
        LOG.warning("%s already exists" % target_path)
        return

    os.symlink(os.path.realpath(source_path), target_path)


def mkdirp(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def lndir_folders(source_folder, target_folder):
    global ignored_folder

    for path, folders, files in os.walk(source_folder):
        relative_path = path[len(source_folder):]

        if not relative_path:
            relative_path = "."
        else:
            relative_path = relative_path[1:]

        base_path = os.path.basename(relative_path)
        target_folder_relative = os.path.abspath(os.path.join(target_folder, relative_path))

        if base_path in files_to_skip:
            ignored_folder = target_folder_relative
            continue

        if ignored_folder and target_folder_relative.startswith(ignored_folder):
            continue

        if ignored_folder:
            ignored_folder = None

        mkdirp(target_folder_relative)

        for file_name in files:
            if file_name in files_to_skip:
                continue

            source_path = os.path.join(path, file_name)
            target_path = os.path.join(target_folder_relative, file_name)
            link_file(source_path, target_path)


def main():
    logging.basicConfig(
        level=logging.INFO,
        stream=sys.stdout,
        format='%(asctime)-15s %(levelname)-8s %(message)s')

    if len(sys.argv) < 3:
        print_usage("You need to pass a source and target folder")
        sys.exit(1)

    from_folder = sys.argv[1]
    to_folder = sys.argv[2]

    if not os.path.isdir(from_folder):
        print_usage("The source folder is not actually a folder")
        sys.exit(2)

    if not os.path.isdir(to_folder):
        print_usage("The target folder is not actually a folder")
        sys.exit(3)

    lndir_folders(os.path.abspath(from_folder), os.path.abspath(to_folder))

if __name__ == '__main__':
    main()
