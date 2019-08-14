#!/usr/bin/env python

import sys
import os
import textwrap
import errno


files_to_skip = {
    ".git",
    ".hg",
    ".ssh",
    ".svn"
}


def print_usage(custom_message):
    print(textwrap.dedent("""\
        Usage: lndir.py source_folder target_folder

        %s
    """ % custom_message))


def link_file(source_path, target_path):
    print("ln %s -> %s" % (source_path, target_path))


def mkdirp(path):
    print("mkdir -p %s" % path)
    try:
        #os.makedirs(path)
        pass
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def lndir_folders(source_folder, target_folder):
    source_path = os.path.abspath(source_folder)
    for path, folders, files in os.walk(source_path):
        relative_path = source_path[len(path):]
        if not relative_path:
            relative_path = "."
        print("source path: %s, path: %s, relative: %s" % (source_path, path, relative_path))

        if path in files_to_skip:
            continue

        print("path is %s" % path)
        target_path = os.path.join(target_folder, path)
        print("target path is %s" % target_path)

        mkdirp(target_path)

        for file_name in files:
            source_path = os.path.join(source_folder, path, file_name)
            link_file(source_path, target_path)


def main():
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

    lndir_folders(from_folder, to_folder)

if __name__ == '__main__':
    main()
