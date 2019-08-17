# json

Provides support for interacting with json data through an extended dkjson module.

## Values

<dl class="describe">
<dt><code class="descname">null: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

You can use this value for setting explicit null values.

</dd>
<dt><code class="descname">version: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

Current version of dkjson.

</dd>
</dl>

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

<dl class="describe">
<dt><code class="descname"><a href="json/decode.html">decode</a>(<i>s:</i> string, <i>position:</i> number, <i>nullValue:</i> any) -> table</code></dt>
<dd>

Decode string into a table.

</dd>
<dt><code class="descname"><a href="json/encode.html">encode</a>(<i>object:</i> any, <i>state:</i> table) -> string</code></dt>
<dd>

Create a string representing the object. Object can be a table, a string, a number, a boolean, nil, json.null or any object with a function __tojson in its metatable. A table can only use strings and numbers as keys and its values have to be valid objects as well. It raises an error for any invalid data types or reference cycles.

</dd>
<dt><code class="descname"><a href="json/loadfile.html">loadfile</a>(<i>fileName:</i> string) -> table</code></dt>
<dd>

Loads the contents of a file through json.decode. Files loaded from Data Files\MWSE\{fileName}.json.

</dd>
<dt><code class="descname"><a href="json/quotestring.html">quotestring</a>(<i>s:</i> string) -> string</code></dt>
<dd>

Quote a UTF-8 string and escape critical characters using JSON escape sequences. This function is only necessary when you build your own __tojson functions.

</dd>
<dt><code class="descname"><a href="json/savefile.html">savefile</a>(<i>fileName:</i> string, <i>object:</i> any, <i>config:</i> table)</code></dt>
<dd>

Saves a serializable table to Data Files\MWSE\{fileName}.json, using json.encode.

</dd>
</dl>
