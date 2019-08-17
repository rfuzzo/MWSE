# findDialogue

Locates a root dialogue that can then be filtered down for a specific actor to return a specific dialogue info For example, a type of 2 and a page of 1 will return the "Greeting 0" topic.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">type: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of dialogue to look for: 1 for voice, 2 for greeting, 3 for service.

</dd>
<dt><code class="descname">page: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The page of dialogue to fetch.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">dialogue: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a></code></dt>
<dd>

No description available.

</dd>
</dl>
