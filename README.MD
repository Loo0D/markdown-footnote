# Pandoc-compatible Markdown footnotes for Atom

`ctrl-shift-f` / `cmd-shift-f` inserts a Pandoc-style "`[^1]`" footnote at cursor position, then adds a new line at the end of the file with the same reference, ready for pasting of the link (or any other footnote text)

After inserting the footnote, `ctrl-shift-b` / `cmd-shift-b` places the cursor back in the body of the text, just after the initial reference. In other words, its a shortcut back to the place in the text body where you inserted the footnote, to save you the trouble of scrolling up for it from the end of a long document.

## Footnote Numbering - 4 characters of an MD5 hash

To remove the hassle of having to track footnote numbering across the file or between collaborators, each footnote uses a "unique" 4-character alphanumeric reference, i.e. `[^79d6]`. When rendered by Pandoc, these will become sequentially numbered as normal.

The "unique" references are generated from an MD5 hash of two random numbers. 4 characters could, in theory, lead to collisions but this is highly unlikely in normal use.
