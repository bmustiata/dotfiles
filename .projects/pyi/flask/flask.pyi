from typing import TypeVar, Callable, List

T = TypeVar('T')  # generic


class Flask(object):
    def __init__(self, name: str) -> None:
        pass

    def route(self,
              path: str,
              methods: List[str] = None) -> Callable[..., T]:
        pass

    def errorhandler(self, error_code: int) -> Callable[..., T]:
        pass

    def run(self,
            host: str = None,
            port: int = 0,
            debug: bool = False):
        pass


def render_template(template: str, **kw):
    pass


def abort(return_code: int,
          message: str) -> None:
    pass


def send_from_directory(folder: str,
                        file_name: str) -> str:
    pass
