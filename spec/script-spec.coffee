script = require '../lib/script'
ScriptView = require '../lib/script-view'
{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "script", ->

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model

    waitsFor ->
      atom.packages.activatePackage('script')

  describe "when the script:run-selection event is triggered", ->
    it "splits pane to the right and runs script", ->

      waitsFor ->
        atom.workspaceView.open()

      runs ->
        expect(atom.workspaceView.getPanes()).toHaveLength(1)
        atom.workspaceView.trigger "script:run-selection"
        expect(atom.workspaceView.getPanes()).toHaveLength(2)
