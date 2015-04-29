# Get Atom defaults
tabLength = atom.config.get('editor.tabLength')
softTabs = atom.config.get('editor.softTabs')
defaultIndentSize = (if softTabs then tabLength else 1)
defaultIndentChar = (if softTabs then " " else "\t")
defaultIndentWithTabs = not softTabs

module.exports = {

    name: "SQL"
    namespace: "sql"

    ###
    Supported Grammars
    ###
    grammars: [
        "SQL (Rails)"
        "SQL"
    ]

    ###
    Supported extensions
    ###
    extensions: [
        "sql"
    ]

    options:
        # SQL
        indent_size:
            type: 'integer'
            default: defaultIndentSize
            minimum: 0
            description: "Indentation size/length"
        keywords:
            type: 'string'
            default: "upper"
            description: "Change case of keywords"
            enum: ["lower","upper","capitalize"]
        identifiers:
            type: 'string'
            default: "lower"
            description: "Change case of identifiers"
            enum: ["lower","upper","capitalize"]
        sqlformat_path:
            type: 'string'
            default: ""
            description: "Path to the `sqlformat` CLI executable"



    ###
    Selected beautifier
    ###
    beautifier: "JS Beautifier"

}