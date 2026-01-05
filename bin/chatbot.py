#!/usr/bin/env python

import click
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage, AIMessage

# Set the URL of your vLLM server
#inference_server_url = "http://localhost:8000/v1"
inference_server_url = "http://gmktek:11434/v1"

model_name = "qwen3-coder:30b"
#model_name="Qwen/Qwen2.5-7B-Instruct"
# model="Qwen/Qwen2.5-14B-Instruct-1M",
# model="Qwen/QwQ-32B",
#model_name = "Qwen/QwQ-32B"
#model_name = "Qwen/Qwen3-0.6B"
#model_name = "Qwen/Qwen2.5-32B-Instruct"

@click.command()
@click.option("--model", "-m",
              help=f"Model name, default {model_name}",
              default=model_name)
@click.option("--qwq", is_flag=True, default=False,
              help="Use the Qwen/QwQ-32B Model")
@click.option("--reason", "-r", is_flag=True, default=False,
              help="Mark that this model is a reasoning model. For simplifying calls to the same model name")
def main(model: str, qwq: bool, reason: bool) -> None:
    if qwq:
        model = "Qwen/QwQ-32B"

    # Initialize the ChatOpenAI model
    # max_tokens=8192,
    llm = ChatOpenAI(
        model = model,
        openai_api_key="EMPTY",
        openai_api_base=inference_server_url,
        temperature=0,
        model_kwargs = {
            "stream" : True,
        }
    )

    system_message = read_multiline_message("⚙️ system> ")

    # Create messages
    messages = [
        SystemMessage(content=system_message),
    ]

    while True:
        user_message = read_multiline_message("👨   user> ")
        messages.append( HumanMessage(content=user_message) )

        ai_message = ""

        response_started = False
        is_thinking = is_thinking_model(model_name) or reason

        if is_thinking:
            print("🧠")

        for response_segment in llm.stream(messages):
            if response_segment.content == "</think>":
                is_thinking = False
                continue

            if is_thinking:
                continue

            if not response_started:
                response_started = True
                print("🤖    bot> ", end="")

            ai_message += response_segment.content
            print(response_segment.content, end="", flush=True)

        print()
        print()

        messages.append(AIMessage(content=ai_message))


def read_multiline_message(prompt: str) -> str:
    print(prompt, end="")

    message = ""
    last_message = input()

    while last_message != '\t':  # a single tab marks the end of input
        message += last_message + "\n"
        last_message = input()

    return message


def is_thinking_model(model_name: str) -> bool:
    if model_name in [
        "Qwen/QwQ-32B",
        ]:
        return True

    return False


if __name__ == "__main__":
    main()

