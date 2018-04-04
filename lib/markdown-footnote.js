"use strict";

const md5 = require('md5');

Object.defineProperty(exports, "__esModule", { value: true });
var atom_1 = require("atom");
var MarkdownFootnote;
var CompositeDisposable = require('atom').CompositeDisposable;
module.exports = (MarkdownFootnote = { subscriptions: null,
    referenceChars: 4,
    usedFootnote: false,
    originalPosition: new atom_1.Point(1, 1),

    activate: function (state) {
        var _this = this;
        // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
        this.subscriptions = new CompositeDisposable;
        // Register command that toggles this view
        this.subscriptions.add(atom.commands.add('atom-workspace', { 'markdown-footnote:add': function () { return _this.add(); } }));
        return this.subscriptions.add(atom.commands.add('atom-workspace', { 'markdown-footnote:back': function () { return _this.back(); } }));
    },
    deactivate: function () {
        return this.subscriptions.dispose();
    },
    add: function () {
        var editor;
        if (editor = atom.workspace.getActiveTextEditor()) {
            var hash = md5((Math.random() * 100) + (Math.random() * 100));
            this.originalPosition = editor.getCursorBufferPosition();
            editor.insertText("[^" + hash.substr(1, this.referenceChars) + "]");
            var lastRow = editor.getLineCount();
            editor.setCursorBufferPosition([lastRow, 0]);
            // add an newline to the end of the buffer
            editor.moveToEndOfLine();
            editor.insertText('\n');
            editor.insertText("[^" + hash.substr(1, this.referenceChars) + "]: ");
            this.usedFootnote = true;
            console.log(`Setting this.moved to ${this.usedFootnote}`);
        }
    },
    back: function (originalPosition) {
        var editor;
        if (editor = atom.workspace.getActiveTextEditor()) {
            if (this.usedFootnote) {
                var endOfFootnoteMarker = this.originalPosition;
                endOfFootnoteMarker.column = endOfFootnoteMarker.column + this.referenceChars + 3;
                editor.setCursorBufferPosition(endOfFootnoteMarker);
            }
        }
    }
});
