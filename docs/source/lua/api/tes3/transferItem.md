# transferItem

Moves one or more items from one reference to another. Returns the actual amount of items successfully transferred.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">from: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

Who to take items from.

</dd>
<dt><code class="descname">to: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

Who to give items to.

</dd>
<dt><code class="descname">item: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3item|string.html">tes3item|string</a></code></dt>
<dd>

The item to transfer.

</dd>
<dt><code class="descname">itemData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a></code></dt>
<dd>

The specific item data to transfer if, for example, you want to transfer a specific player item.

</dd>
<dt><code class="descname">count: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The maximum number of items to transfer.

</dd>
<dt><code class="descname">playSound: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, the up/down sound for the item won't be played.

</dd>
<dt><code class="descname">limitCapacity: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, items can be placed into containers that shouldn't normally be allowed. This includes organic containers, and containers that are full.

</dd>
<dt><code class="descname">updateGUI: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, the function won't manually resync the player's GUI state. This can result in some optimizations, though `tes3ui.forcePlayerInventoryUpdate()` must manually be called after all inventory updates are finished.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">transferredCount: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
</dl>
