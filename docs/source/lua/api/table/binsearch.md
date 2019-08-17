# binsearch

Performs a binary search for a given value.

If the  value is found:
	It returns a table holding all the mathing indices (e.g. { startindice,endindice } )
	endindice may be the same as startindice if only one matching indice was found
If compval is given:
	then it must be a function that takes one value and returns a second value2,
	to be compared with the input value, e.g.:
	compvalue = function( value ) return value[1] end
If reversed is set to true:
	then the search assumes that the table is sorted in reverse order (largest value at position 1)
	note when reversed is given compval must be given as well, it can be nil/_ in this case
Return value:
	on success: a table holding matching indices (e.g. { startindice,endindice } )
	on failure: nil

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
<dt><code class="descname">compval: <a href="https://mwse.readthedocs.io/en/latest/lua/type/any.html">any</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">reversed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/any.html">any</a></code></dt>
<dd>

No description available.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">undefined: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

No description available.

</dd>
</dl>
