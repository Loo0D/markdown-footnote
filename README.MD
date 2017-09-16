# Pandoc-compatible Markdown footnotes for Atom

`ctrl-shift-f` inserts a Pandoc-style `[^1]` footnote at cursor position, then adds a new line at the end of the file with the same reference, ready for pasting of the link (or any other footnote text)

After inserting the footnote, `ctrl-shift-b` places the cursor back in the body of the text, just after the initial reference. In other words, its a shortcut back to the place in the text where you inserted the footnote, to save you the trouble of scrolling up for it from the end of a long document.

## Numbering - 4 characters of an MD5 hash

To remove the hassle of having to track footnote numbering across the file or between collaborators, each footnote uses a "unique" 4-character alphanumeric reference, i.e. `[^79d6]`. When rendered by Pandoc, these will become sequentially numbered as normal.

The "unique" references are generated from an MD5 hash of file contents plus a random number. 4 characters could, in theory, lead to collisions but this is highly unlikely in normal use.

## Known Issues

** - Pull requests welcome - **

When using the context menu to insert the footnote, although the cursor is placed correctly at the end of the document, the editor window appears to lose focus. Typing text immediately after such insertion does not work, user needs to click inside the document, after which entering text works as normal. This issue does not occur with keyboard shortcuts or menu bar (`Packages`) commands. For this reason context menu items are commented out in `menus/markdown-footnote.cson` file.
