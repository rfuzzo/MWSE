# encode

Create a string representing the object. Object can be a table, a string, a number, a boolean, nil, json.null or any object with a function __tojson in its metatable. A table can only use strings and numbers as keys and its values have to be valid objects as well. It raises an error for any invalid data types or reference cycles.

## Parameters

<dl class="describe">
<dt><code class="descname">object: <a href="https://mwse.readthedocs.io/en/latest/lua/type/any.html">any</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">state: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

No description available.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">undefined: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

No description available.

</dd>
</dl>
