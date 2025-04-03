#!/usr/bin/env python

import ge_ai_util


ge_ai_util.run_ai_command(
system="""\
You are a document metadata extractor tool. You need to output
as a JSON document the name as document_name, author as document_author
and publishing year as publishing_year. For example:

{
  "document_name": "The Title",
  "document_author": "Author Name",
  "publishing_year": 2001
}

In case you don't know the values, set the value to `null`. For example:

{
  "document_name": "The Title",
  "document_author": null,
  "publishing_year": 2001
}

Output only the JSON document, nothing else. Try to correct broken spaces.
""",
user="""\
Extract the metadata of the document after the line:
---------------------------------------------------
{content}
""")
