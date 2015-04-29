###
Language Support and default options.
###
"use strict"
# Lazy loaded dependencies
_ = require('lodash')
extend = null

# Get Atom defaults
tabLength = atom.config.get('editor.tabLength')
softTabs = atom.config.get('editor.softTabs')
defaultIndentSize = (if softTabs then tabLength else 1)
defaultIndentChar = (if softTabs then " " else "\t")
defaultIndentWithTabs = not softTabs

#
module.exports = class Languages

  # Supported unique configuration keys
  # Used for detecting nested configurations in .jsbeautifyrc
  languageNames: [
    "c-sharp"
    "c"
    "coffeescript"
    "cpp"
    "css"
    "d"
    "erb"
    "handlebars"
    "html"
    "java"
    "javascript"
    "json"
    "jsx"
    "less"
    "markdown"
    'marko'
    "mustache"
    "objective-c"
    "pawn"
    "perl"
    "php"
    "python"
    "ruby"
    "sass"
    "scss"
    "sql"
    "tss"
    "typescript"
    "vala"
  ]

  ###
  Languages
  ###
  languages: null

  ###
  Namespaces
  ###
  namespaces: null

  ###
  Constructor
  ###
  constructor: ->
      @languages = _.map(@languageNames, (name) ->
          require("./#{name}")
      )
      @namespaces = _.map(@languages, (language) -> language.namespace)

  ###
  Get language for grammar and extension
  ###
  getLanguages: (grammar, extension) ->
    #   console.log(grammar, extension, @languages)
      _.union(
          _.filter(@languages, (language) -> _.contains(language.grammars, grammar))
          _.filter(@languages, (language) -> _.contains(language.extensions, extension))
      )