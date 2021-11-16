#!/usr/bin/env python

import click

@click.command()
@click.argument("input_file", nargs=1)
def main(input_file):
    with open(input_file, 'rb') as f:
        content = f.read()
    print(content.hex())


if __name__ == "__main__":
    main()
