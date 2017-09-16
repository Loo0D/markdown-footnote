{CompositeDisposable} = require 'atom'

module.exports = MarkdownFootnote =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'markdown-footnote:add': => @add()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    markdownFootnoteViewState: @markdownFootnoteView.serialize()

  add: ->
    if editor = atom.workspace.getActiveTextEditor()
      md5 = require 'md5'
      random = Math.random() * 100
      hash = md5(editor.getText() + random)
      editor.insertText("[^#{hash.substr(1,4)}]")

      lastRow = editor.getLineCount()
      editor.setCursorBufferPosition([lastRow,0])
      editor.moveToEndOfLine()
      editor.insertText('\n')
      editor.insertText("[^#{hash.substr(1,4)}]: ")
