# removeItem

Removes an item to a given reference's inventory.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

Who to give items to.

</dd>
<dt><code class="descname">item: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3item|string.html">tes3item|string</a></code></dt>
<dd>

The item to remove.

</dd>
<dt><code class="descname">count: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The maximum number of items to remove.

</dd>
<dt><code class="descname">playSound: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, the up/down sound for the item won't be played.

</dd>
<dt><code class="descname">updateGUI: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If false, the function won't manually resync the player's GUI state. This can result in some optimizations, though `tes3ui.forcePlayerInventoryUpdate()` must manually be called after all inventory updates are finished.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">removedCount: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
</dl>
