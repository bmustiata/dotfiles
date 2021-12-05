#!/usr/bin/env python

import click
import re
import datetime
from typing import List, Optional

FILE_RECORD_RE = re.compile(r'^(\d+/\d+\.\d+)\s|[^\s]+\s+(\d+/\d+\.\d+)\s')


class FileTracker:
    def __init__(self, file_name: str) -> None:
        self.file_name = file_name
        self._f = FileReader(file_name)
        self._record = self._try_read_record()

    def has_record(self) -> bool:
        return self._record is not None

    def peek_record(self) -> 'FileRecord':
        assert self._record is not None
        return self._record

    def read_record(self) -> 'FileRecord':
        result = self._record

        if not result:
            raise Exception(f"bug: no record anymore in {self.file_name}")

        try:
            self._record = self._try_read_record()
        except Exception as e:
            raise Exception(f"failure reading record in {self.file_name} at line {self._f.current_line}", e)

        return result

    def _try_read_record(self) -> Optional['FileRecord']:
        line = self._f.readline()

        if not line:
            return None

        record = FileRecord(self, line)

        self._f.advance()
        line = self._f.readline()

        while record.try_extend_content(line):
            self._f.advance()
            line = self._f.readline()

        return record

    def close(self):
        self._f.close()

    @property
    def current_line(self) -> int:
        return self._f.current_line


class FileReader:
    def __init__(self, file_name: str) -> None:
        self._f = open(file_name, "rt", encoding="latin9")
        self.current_line = 1
        self._line: Optional[str] = self._f.readline()

    def readline(self) -> Optional[str]:
        return self._line

    def advance(self) -> None:
        if self._line is None:
            return None

        self._line = self._f.readline()
        self.current_line += 1

        if not self._line:
            self._line = None
            return

        self._line = self._line.rstrip()

    def close(self):
        self._f.close()


class FileRecord:
    def __init__(self, file_tracker: FileTracker, line: str) -> None:
        if not self._line_starts_file_record(line):
            raise Exception(f"Wrong line passed to start ar record: {line}")

        self.content = line
        self.timestamp = self._extract_timestamp(line)
        self.file_tracker = file_tracker

    def try_extend_content(self, line: Optional[str]) -> bool:
        if line is None:
            return False

        if self._line_starts_file_record(line):
            return False

        self.content += '\n' + line
        return True

    def _line_starts_file_record(self, line: str) -> bool:
        m = FILE_RECORD_RE.match(line)

        return m is not None

    def _extract_timestamp(self, line: str) -> float:
        m = FILE_RECORD_RE.match(line)

        if not m:
            raise Exception(f"Unable to read timestamp from line: {line}")

        t = m.group(1) or m.group(2)
        parsed_time = datetime.datetime.strptime(t, "%Y%m%d/%H%M%S.%f")
        return parsed_time.timestamp()


@click.argument("files_to_mix", nargs=-1)
@click.option("--output", "-o",
              help="Specify output file",
              default="out.txt")
@click.command()
def main(files_to_mix, output):
    file_trackers: List[FileTracker] = [FileTracker(file_name) for file_name in files_to_mix]

    with open(output, 'wt', encoding='utf-8') as out:
        while (next_record := load_next_record(file_trackers)):
            out.write(f"{next_record.file_tracker.file_name} ")
            out.write(next_record.content)
            out.write("\n")

    for file_tracker in file_trackers:
        file_tracker.close()

    write_statistics(file_trackers)


def load_next_record(file_trackers: List[FileTracker]) -> Optional[FileRecord]:
    records = []

    for file_tracker in file_trackers:
        if not file_tracker.has_record():
            continue

        records.append(file_tracker.peek_record())

    if not records:
        return None

    records.sort(key=lambda it: it.timestamp)
    result = records[0]

    result.file_tracker.read_record()

    return records[0]


def write_statistics(file_trackers: List[FileTracker]) -> None:
    for file_tracker in file_trackers:
        print(f"{file_tracker.file_name} -> {file_tracker.current_line} lines read")



if __name__ == "__main__":
    main()
