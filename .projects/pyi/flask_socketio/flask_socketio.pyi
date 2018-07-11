from typing import Any, Callable, TypeVar
from flask import Flask


T = TypeVar('T')
MessageHandler = Callable[[str], None]


class SocketIO(object):
    def __init__(self,
                 app: Flask,
                 async_mode: str) -> None:
        pass

    def on(self, message_type: str) -> Callable[[MessageHandler], T]:
        pass


def send(message: Any):
    pass
