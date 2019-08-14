# json

Provides support for interacting with json data through an extended dkjson module.

## Values

```eval_rst
.. toctree::
    :hidden:

    json/null
    json/version
```

#### [null](json/null.md)

> You can use this value for setting explicit null values.

#### [version](json/version.md)

> Current version of dkjson.

## Functions

```eval_rst
.. toctree::
    :hidden:

    json/decode
    json/encode
    json/loadfile
    json/quotestring
    json/savefile
```

#### [decode](json/decode.md)

> Decode string into a table.

#### [encode](json/encode.md)

> Create a string representing the object. Object can be a table, a string, a number, a boolean, nil, json.null or any object with a function __tojson in its metatable. A table can only use strings and numbers as keys and its values have to be valid objects as well. It raises an error for any invalid data types or reference cycles.

#### [loadfile](json/loadfile.md)

> Loads the contents of a file through json.decode. Files loaded from Data Files\MWSE\{fileName}.json.

#### [quotestring](json/quotestring.md)

> Quote a UTF-8 string and escape critical characters using JSON escape sequences. This function is only necessary when you build your own __tojson functions.

#### [savefile](json/savefile.md)

> Saves a serializable table to Data Files\MWSE\{fileName}.json, using json.encode.
