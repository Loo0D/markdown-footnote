{CompositeDisposable} = require 'atom'

module.exports = MarkdownFootnote =
  subscriptions: null
  originalPosition: [1,1]
  referenceChars: 4

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'markdown-footnote:add': => @add()
    @subscriptions.add atom.commands.add 'atom-workspace', 'markdown-footnote:back': => @back()
  deactivate: ->
    @subscriptions.dispose()

  add: ->
    if editor = atom.workspace.getActiveTextEditor()
      md5 = require 'md5'
      random = Math.random() * 100
      hash = md5(editor.getText() + random)
      @originalPosition = editor.getCursorBufferPosition() # returns 'Point'
      editor.insertText("[^#{hash.substr(1,@referenceChars)}]")
      lastRow = editor.getLineCount()
      editor.setCursorBufferPosition([lastRow,0])
      editor.moveToEndOfLine()
      editor.insertText('\n')
      editor.insertText("[^#{hash.substr(1,@referenceChars)}]: ")

  back: ->
    if editor = atom.workspace.getActiveTextEditor()
      endOfMarker = @originalPosition.toArray()
      endOfMarker[1] = endOfMarker[1] + @referenceChars + 3
      editor.setCursorBufferPosition(endOfMarker)
