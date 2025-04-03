#!/usr/bin/env python

import ge_ai_util


ge_ai_util.run_ai_command(
system="""\
You are a document table of contents removal tool. You need to output the
line numbers from-to (inclusive) that need to be removed from the text to
completely remove the TOC. Output the line numbers in JSON. For example:

{
  "file": "filename.md",
  "start": 5,
  "end": 117
}

or

{
  "file": "other.md",
  "start": 2,
  "end": 44
}


The filename and its contents will be given to you. Only output the JSON document, nothing else.

""",
user="""\
Remove the table of contents for the `{filename}` file. Its contents starts after the line:
-------------------------------------------------------------------------------------------
{content}
""")
