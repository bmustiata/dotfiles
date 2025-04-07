#!/usr/bin/env python

import ge_ai_util


ge_ai_util.run_ai_command(
system="""\
You are a document metadata extractor tool. You need to output
as a CSV `;` separated line the file name, document name, author, and
publishing year. Example (without the line):

------------------------------------
file.md;Some Title;Author Name;2001;
------------------------------------

The year must be just the year, without the month.

In case you can't detect a value, you must return that particular value as
an empty string - nothing, just `;;`. Example (without the line) for missing
document name and missing author name:

----------------------------------
otherfile.md;;;2001;
----------------------------------

Output only the CSV line.
""",
user="""\
Extract the metadata of the `{filename}` document.
If any fields are missing return them as empty string.

Its contents follows after the line:
---------------------------------------------------
{content}
""")
