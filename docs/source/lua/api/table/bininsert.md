# bininsert

Inserts a given value through BinaryInsert into the table sorted by [, comp].

If 'comp' is given, then it must be a function that receives two table elements, and returns true when the first is less than the second, e.g. comp = function(a, b) return a > b end, will give a sorted table, with the biggest value on position 1. [, comp] behaves as in table.sort(table, value [, comp]) returns the index where 'value' was inserted

## Parameters

<dl class="describe">
<dt><code class="descname">t: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">value: <a href="https://mwse.readthedocs.io/en/latest/lua/type/any.html">any</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">comp: <a href="https://mwse.readthedocs.io/en/latest/lua/type/any.html">any</a></code></dt>
<dd>

No description available.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">undefined: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
</dl>
