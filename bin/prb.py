#!/usr/bin/env python3

import click


NUM_COLOR = "\033[94m"  # Dark blue for numbers
TEXT_COLOR = "\033[96m"  # Light blue for text
BOLD = "\033[1m"  # Bold text
ITALIC = "\033[3m"  # Italic text
NORMAL = "\033[23m\033[22m"  # Normal text (not italic or bold)
RESET = "\033[0m"  # Reset terminal colors


@click.command()
def main() -> None:
    print(f"""
{NUM_COLOR}{BOLD}1.{RESET} {TEXT_COLOR}What {BOLD}{ITALIC}is great{NORMAL} about this problem?
{NUM_COLOR}{BOLD}2.{RESET} {TEXT_COLOR}What {BOLD}{ITALIC}is not perfect{NORMAL} yet?
{NUM_COLOR}{BOLD}3.{RESET} {TEXT_COLOR}What am I {BOLD}{ITALIC}willing to do{NORMAL} to make it the way I want it?
{NUM_COLOR}{BOLD}4.{RESET} {TEXT_COLOR}What am I {BOLD}{ITALIC}willing to stop{NORMAL} to make it the way I want it?
{NUM_COLOR}{BOLD}5.{RESET} {TEXT_COLOR}How can {BOLD}{ITALIC}I enjoy the process{NORMAL} while I do it the way I want it?
    """)


if __name__ == "__main__":
    main()
