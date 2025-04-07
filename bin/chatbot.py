#!/usr/bin/env python

import click
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage, AIMessage

# Set the URL of your vLLM server
inference_server_url = "http://localhost:8000/v1"


model_name="Qwen/Qwen2.5-7B-Instruct"
# model="Qwen/Qwen2.5-14B-Instruct-1M",
# model="Qwen/QwQ-32B",
#model_name = "Qwen/QwQ-32B"

@click.command()
@click.option("--model", "-m",
              help=f"Model name, default {model_name}",
              default=model_name)
@click.option("--qwq", is_flag=True, default=False,
              help="Use the Qwen/QwQ-32B Model")
def main(model: str, qwq: bool) -> None:
    if qwq:
        model = "Qwen/QwQ-32B"

    # Initialize the ChatOpenAI model
    # max_tokens=8192,
    llm = ChatOpenAI(
        model = model,
        openai_api_key="EMPTY",
        openai_api_base=inference_server_url,
        temperature=0.5,
        model_kwargs = {
            "stream" : True,
        }
    )

    print("🏚️ system> ", end="")
    system_message = input()

    # Create messages
    messages = [
        SystemMessage(content=system_message),
    ]

    while True:
        print("👨   user> ", end="")
        user_message = input()

        messages.append( HumanMessage(content=user_message) )

        ai_message = ""

        response_started = False
        is_thinking = is_thinking_model(model_name)

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

        messages.append(AIMessage(content=ai_message))


def is_thinking_model(model_name: str) -> bool:
    if model_name in [
        "Qwen/QwQ-32B",
        ]:
        return True

    return False


if __name__ == "__main__":
    main()

