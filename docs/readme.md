# MWSE Documentation

Looking for MWSE documentation? Please [click here](https://mwse.github.io/MWSE/).


## Synopsis

The docs for this project are created for [GitHub Pages](https://pages.github.com/) using [mkdoc](https://www.mkdocs.org). Documentation is done in the Markdown format. Once a doc is pushed to this repository it will automatically be updated at [the documentation site](https://mwse.github.io/MWSE/).


## Autocomplete Definitions

Some portions of the docs, include Lua type information, events, and APIs, are auto-generated using the content in the autocomplete root folder. Edit these definitions instead, and run the configured vscode build task in the autocomplete folder to regenerate the needed files.

There are four basic types of definitions:
- [event definitions](https://github.com/MWSE/MWSE/blob/master/docs/event-definitions-guide.md)
- [type definitions](https://github.com/MWSE/MWSE/blob/master/docs/type-definitions-guide.md)
- [function definitions](https://github.com/MWSE/MWSE/blob/master/docs/function-definitions-guide.md)
- [operator definitions](https://github.com/MWSE/MWSE/blob/master/docs/operator-definitions-guide.md)

Clicking on the links above will take you to a guide for writing mentioned definitions.

## Building

Documentation can also be built locally for testing or personal use. To do this you will need a copy of [Python](https://www.python.org/).

The following modules need to be installed:

```bat
pip install mkdocs mkdocs-material mkdocs-awesome-pages-plugin mkdocs-mermaid2-plugin mkdocs-git-revision-date-localized-plugin
```

Another build task is available in vscode to live test the docs locally.

## Developing Tips

When writing the examples, always advise using `tes3.*` constants when available. Also, consider suggesting when a certain function accepts values from `tes3.*` namespace. If writing about color properties, mention the color range, e.g. [0.0, 1.0] or [0, 255]. Note that some older areas of the documentation might not follow the conventions established in the guides above. Those can be updated if editing the affected definitions.

Some parts of the documentation are written by hand. Namely, those in:
- docs\source\references
- docs\source\guides

For a list of all the available features supported by our documentation see Material for MkDocs' [documentation](https://squidfunk.github.io/mkdocs-material/reference/).

### Admonitions

The following admonition classes are available: `abstract`, `bug`, `danger`, `example`, `failure`, `info`, `note`, `question`, `quote`, `success`, `tip`, `warning`. An adominition starts with three exclamation characters (`!!!`) followed by adominition class and an optional title in double quotes. The body of the adominition needs to be indented. If you want to insert a new line in the rendered adominition you need to leave a one line empty. To create a collapsible block, start the adominition with `???` instead of `!!!`. Adding a `+` after the `???` token will render the block expanded by default. For more info see the official [documentation](https://squidfunk.github.io/mkdocs-material/reference/admonitions/). An example:

```markdown
!!! tip "This text will override the adominition title"
	This is the text of the adominition. The default title if none provided is the name of the adominition class (tip in this example).

	This will be on the line after on the rendered page.
	This will be on the same line as the line before this one on the renderd page.
```

### Customizing Navigation

To customize the navigation MkDocs Awesome Pages Plugin is used. Read [it's documentation](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin#features) for usage examples.

### Diagrams

You can write diagrams using Mermaid.js annotation. Mermaid syntax is covered in detail in its [documentation](https://mermaid.js.org/syntax/flowchart.html). For quick editing, you can write your concept online [here](https://mermaid-js.github.io/mermaid-live-editor/). For an example of such a diagram you can look at [The hierarchy of NetImmerse Classes](source/references/other/ni-class-hierarchy.md#diagrammatic-representation).

### Key Combinations

To annotate key combinations with style you can use the syntax provided by markdown. A key or combination of key presses is surrounded by `++` with each key press separated with a single `+`. An example: `++ctrl+x++`. For more info see the related extension's [documentation](https://facelessuser.github.io/pymdown-extensions/extensions/keys/).

### Snippets

Snippets is an extension to insert markdown or HTML snippets into another markdown file. Snippets is great for situations where you have content you need to insert into multiple documents. For more info see the related extension's [documentation](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/).

### Fenced Code Blocks

The [SuperFences extension](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/#superfences) allows for arbitrary nesting of code and content blocks inside each other, including admonitions, tabs, lists and all other elements.
