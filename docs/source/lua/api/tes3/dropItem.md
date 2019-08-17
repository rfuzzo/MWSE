# dropItem

Drops one or more items from a reference's inventory onto the ground at their feet.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor|tes3reference|string.html">tes3mobileActor|tes3reference|string</a></code></dt>
<dd>

The reference whose inventory will be modified.

</dd>
<dt><code class="descname">item: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3item|string.html">tes3item|string</a></code></dt>
<dd>

The item to drop.

</dd>
<dt><code class="descname">itemData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a></code></dt>
<dd>

The item data to match.

</dd>
<dt><code class="descname">count: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of items to drop.

</dd>
<dt><code class="descname">matchExact: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the exact item will be matched. This is important if you want to drop an item without item data.

</dd>
<dt><code class="descname">updateGUI: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, the player or contents menu won't be updated.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">createdReference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

No description available.

</dd>
</dl>
