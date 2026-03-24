#!/usr/bin/env python

from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import List

import click
import sys
import os
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage, AIMessage


@click.command()
@click.option("--server", "-s",
              help="Server to use.",
              default="http://gmktek:11434/v1")
@click.option("--model-name", "--model", "-m",
              help="Model to use. (mradermacher/Qwen3-Coder-Next-REAM-GGUF:Q4_K_M)",
              default="mradermacher/Qwen3-Coder-Next-REAM-GGUF:Q4_K_M")
@click.option("--system-prompt", "--system",
              help="Specify the system message for the LLM (file name)",
              default="<none>")
@click.option("--user-prompt", "--user",
              help="Specify the user message for the LLM (file name)",
              default="<none>")
@click.option("--head",
              help="Truncate the input to the first n lines")
@click.option("--tail",
              help="Truncate the input to the last n lines")
@click.option("--each-line", "--line", "-l", is_flag=True, default=False,
              help="Process each line of content from the file as {content}")
@click.option("--resume-from",
              help="Resume from a certain line number (0 based)",
              default="0")
@click.option("--parallel", "-p",
              help="Maximum number of parallel LLM tasks (1 = sequential with streaming)",
              default=1,
              type=int)
@click.argument("files", nargs=-1)
def main_call(server: str, model_name: str, resume_from: str, system_prompt: str, user_prompt: str, files: List[str], head: str, tail: str, each_line: bool, parallel: int) -> None:
    global system_message
    global user_message_template

    if system_prompt != "<none>":
        with open(system_prompt, 'r', encoding='utf-8') as f:
            system_message = f.read()
    else:
        system_message = read_multiline_message("⚙️ system> ")

    if user_prompt != "<none>":
        with open(user_prompt, 'r', encoding='utf-8') as f:
            user_message_template = f.read()
    else:
        user_message_template = read_multiline_message("👨   user> ")
    
    items = list(read_input_files(files[int(resume_from):], head, tail, each_line))

    if parallel == 1:
        llm = ChatOpenAI(
            model=model_name,
            openai_api_key="EMPTY",
            openai_api_base=server,
            temperature=0.1,
            model_kwargs={"stream": True},
        )
        for f in items:
            user_message = render_template(user_message_template, f)
            messages = [
                SystemMessage(content=system_message),
                HumanMessage(content=user_message),
            ]
            is_thinking = is_thinking_model(model_name)
            for response_segment in llm.stream(messages):
                if response_segment.content == "</think>":
                    is_thinking = False
                    continue
                if is_thinking:
                    continue
                print(response_segment.content, end="", flush=True)
            print()
    else:
        llm = ChatOpenAI(
            model=model_name,
            openai_api_key="EMPTY",
            openai_api_base=server,
            temperature=0.1,
            model_kwargs={"stream": False},
        )

        def process_item(f):
            user_message = render_template(user_message_template, f)
            messages = [
                SystemMessage(content=system_message),
                HumanMessage(content=user_message),
            ]
            response = llm.invoke(messages)
            return strip_thinking(response.content, model_name)

        with ThreadPoolExecutor(max_workers=parallel) as executor:
            futures = {executor.submit(process_item, f): f for f in items}
            for future in as_completed(futures):
                result = future.result()
                print(result)


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


def strip_thinking(content: str, model_name: str) -> str:
    """Remove <think>...</think> blocks from content for thinking models."""
    while "<think>" in content and "</think>" in content:
        start = content.find("<think>")
        end = content.find("</think>", start)
        if end != -1:
            content = content[:start].lstrip()
            content = content[end + 9:].lstrip()

    return content


def truncate(text: str, head: str, tail: str) -> str:
    lines = text.split("\n")
    if head:
        lines = lines[:int(head)]

    if tail:
        lines = lines[int(tail):]

    return "\n".join(lines)


def read_multiline_message(prompt: str) -> str:
    print(prompt, end="")

    message = ""
    last_message = input()

    while last_message != '\t':  # a single tab marks the end of input
        message += last_message + "\n"
        last_message = input()

    return message


if __name__ == "__main__":
    main_call()
