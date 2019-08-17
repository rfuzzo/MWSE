# getEquippedItem

Returns an actor's equipped item stack, provided a given filter

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">actor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|tes3actor.html">tes3reference|tes3mobileActor|tes3actor</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">enchanted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, filters to enchanted items.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Maps to tes3.objectType constants. Used to filter equipment by type.

</dd>
<dt><code class="descname">slot: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Maps to tes3.armorSlot or tes3.clothingSlot. Used to filter equipment by slot.

</dd>
<dt><code class="descname">type: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Maps to tes3.weaponType. Used to filter equipment by type.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">stack: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3equipmentStack.html">tes3equipmentStack</a></code></dt>
<dd>

No description available.

</dd>
</dl>
