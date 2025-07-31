#!/usr/bin/env python

from typing import List

import click
import sys
import os
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage, AIMessage

# Set the URL of your vLLM server
inference_server_url = "http://localhost:8000/v1"
inference_server_url = "http://10.10.10.2:8000/v1"
#model_name="Qwen/Qwen2.5-14B-Instruct-1M"
#model_name="Qwen/Qwen2.5-7B-Instruct"
model_name="gpt-4"
#model_name="Qwen/QwQ-32B"


system_message = ""
user_message_template = ""


def run_ai_command(system: str, user: str) -> None:
    """
    Runs an AI command with the given system/user prompt, and outputs directly
    on the stdout.

    The `user` variable is a template where the following will be filled with
    their actual concrete values:
    * {filename} - base filename of the current argument file
    * {fileline} - current file line from the readed file
    * {fullpath} - full path of the current argument file
    * {content}  - the content of the current argument file

    If the program is invoked without any file arguments, it
    will read its <stdin> as {content}, and the {filename} and {fullpath} will
    be set as the string "STDIN" if used in the user template.

    If the program is invoked _with_ file arguments, the prompts will be invoked
    for each individual file.
    """
    global system_message
    global user_message_template

    system_message = system
    user_message_template = user

    main_call()


@click.command()
@click.option("--head",
              help="Truncate the input to the first n lines")
@click.option("--tail",
              help="Truncate the input to the last n lines")
@click.option("--each-line", "--line", "-l", is_flag=True, default=False,
              help="Process each line of content from the file as {content}")
@click.argument("files", nargs=-1)
def main_call(files: List[str], head: str, tail: str, each_line: bool) -> None:
    # Initialize the ChatOpenAI model
    # max_tokens=8192,
    llm = ChatOpenAI(
        model = model_name,
        openai_api_key="EMPTY",
        openai_api_base=inference_server_url,
        temperature=0,
        model_kwargs = {
            "stream" : True,
        }
    )

    # Create messages
    for f in read_input_files(files, head, tail, each_line):
        user_message = render_template(user_message_template, f)

        messages = [
            SystemMessage(content=system_message),
            HumanMessage(content=user_message),
        ]

        response_started = False
        is_thinking = is_thinking_model(model_name)

        for response_segment in llm.stream(messages):
            if response_segment.content == "</think>":
                is_thinking = False
                continue

            if is_thinking:
                continue

            print(response_segment.content, end="", flush=True)

        print()


def read_input_files(files: List[str], head: str, tail: str, each_line: bool):
    if each_line:
        return read_each_line_from_files(files, head, tail)

    return read_lines_from_files(files, head, tail)


def read_each_line_from_files(files: List[str], head_string: str, tail_string: str):
    """
    Reads the content yielding line by line.
    """
    if tail_string is not None:
        raise Exception("Cannot specify tail for each line mode")

    linenumber = 1
    head = int(head_string) if head_string else -1

    if head >= 0:
        raise Exception("Cannot specify both head and tail")

    if not files:
        line = sys.stdin.readline()

        while line:
            if head >= 0 and linenumber > head:
                return

            yield {
                "filename": "<STDIN>",
                "fullpath": "<STDIN>",
                "content": line,
                "linenumber": linenumber,
            }

            linenumber += 1
            line = sys.stdin.readline()

        return

    for file in files:
        filename = os.path.basename(file)
        fullpath = os.path.abspath(file)

        with open(file, 'rt', encoding='utf-8') as f:
            line = f.readline()

            while line:
                if head >= 0 and linenumber > head:
                    return

                yield {
                    "filename": filename,
                    "fullpath": fullpath,
                    "content": line,
                    "linenumber": linenumber,
                }

                linenumber += 1
                line = f.readline()


def read_lines_from_files(files: List[str], head: str, tail: str):
    if not files:
        yield {
            "filename": "<STDIN>",
            "fullpath": "<STDIN>",
            "content": truncate(sys.stdin.read(), head, tail),
            "linenumber": 1,
        }
        return

    for file in files:
        yield {
            "filename": os.path.basename(file),
            "fullpath": os.path.abspath(file),
            "content": truncate(read_file(file), head, tail),
            "linenumber": 1,
        }


def read_file(file_name: str) -> str:
    """
    Reads the full content of the file as a string
    """
    with open(file_name, 'r', encoding='utf-8') as f:
        content = f.read()
        return content


def render_template(user_message_template: str, file_config) -> str:
    """
    Renders the user template as a string
    """
    return user_message_template.format(**file_config)


def is_thinking_model(model_name: str) -> bool:
    if model_name in [
        "Qwen/QwQ-32B",
        ]:
        return True

    return False


def truncate(text: str, head: str, tail: str) -> str:
    lines = text.split("\n")
    if head:
        lines = lines[:int(head)]

    if tail:
        lines = lines[int(tail):]

    return "\n".join(lines)

