# Pandoc-compatible Markdown footnote

`ctrl-shift-f` inserts a Pandoc-style `[^1]` footnote at cursor, then adds a new line at the bottom of the file with the same reference, ready for pasting of the link (or any other footnote text)

To remove the hassle of having to track footnote numbering across the file or between collaborators, each footnote uses a "unique" 4-character alphanumeric reference. When rendered to a Word (docx) document, these will become sequentially numbered as normal.

The "unique" references are generated from an MD5 hash of file contents plus a random number. 4 characters could, in theory, lead to collisions but this is highly unlikely in normal use.
