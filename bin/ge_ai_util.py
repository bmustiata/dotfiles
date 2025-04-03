#!/usr/bin/env python

from typing import List

import click
import sys
import os
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage, AIMessage

# Set the URL of your vLLM server
inference_server_url = "http://localhost:8000/v1"
#model_name="Qwen/Qwen2.5-14B-Instruct-1M"
# model_name="Qwen/Qwen2.5-7B-Instruct"
model_name="Qwen/QwQ-32B"


system_message = ""
user_message_template = ""


def run_ai_command(system: str, user: str) -> None:
    """
    Runs an AI command with the given system/user prompt, and outputs directly
    on the stdout.

    The `user` variable is a template where the following will be filled with
    their actual concrete values:
    * {filename} - base filename of the current argument file
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
@click.argument("files", nargs=-1)
def main_call(files: List[str]) -> None:
    # Initialize the ChatOpenAI model
    # max_tokens=8192,
    llm = ChatOpenAI(
        model = model_name,
        openai_api_key="EMPTY",
        openai_api_base=inference_server_url,
        temperature=0.1,
        model_kwargs = {
            "stream" : True,
        }
    )

    # Create messages
    for f in read_input_files(files):
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


def read_input_files(files: List[str]):
    if not files:
        yield {
            "filename": "<STDIN>",
            "fullpath": "<STDIN>",
            "content": sys.stdin.read(),
        }
        return

    for file in files:
        yield {
            "filename": os.path.basename(file),
            "fullpath": os.path.abspath(file),
            "content": read_file(file),
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



