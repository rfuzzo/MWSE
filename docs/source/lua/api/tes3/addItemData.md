# addItemData

Creates an item data if there is room for a new stack in a given inventory. This can be then used to add custom user data or adjust an item's condition. This will return nil if no item data could be allocated for the item -- for example if the reference doesn't have the item in their inventory or each item of that type already has item data.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">to: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

The reference whose inventory will be modified.

</dd>
<dt><code class="descname">item: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3item|string.html">tes3item|string</a></code></dt>
<dd>

The item to create item data for.

</dd>
<dt><code class="descname">updateGUI: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, the player or contents menu won't be updated.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">createdData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a></code></dt>
<dd>

No description available.

</dd>
</dl>
