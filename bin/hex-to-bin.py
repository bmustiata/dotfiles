#!/usr/bin/env python

import click

@click.command()
@click.argument("out", nargs=1)
@click.argument("content", nargs=1)
def main(out, content):
    with open(out, 'wb') as f:
        f.write(bytes.fromhex(content))


if __name__ == "__main__":
    main()

