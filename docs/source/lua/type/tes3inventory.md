# tes3inventory

An inventory composes of an iterator, and flags caching the state of the inventory.

## Properties

<dl class="describe">
<dt><code class="descname">flags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Raw bit-based flags.

</dd>
<dt><code class="descname">iterator: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

Direct acces to the container that holds the inventory's items.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">addItem({<i>mobile:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>item:</i> tes3item, <i>itemData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a>, <i>count:</i> number})</code></dt>
<dd>

Adds an item into the inventory directly. This should not be used, in favor of the tes3 API function.

</dd>
<dt><code class="descname">calculateWeight()</code></dt>
<dd>

Calculates the weight of all items in the container.

</dd>
<dt><code class="descname">contains(<i>item:</i> tes3item|string, <i>itemData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a>) -> boolean</code></dt>
<dd>

Checks to see if the inventory contains an item.

</dd>
<dt><code class="descname">dropItem(<i>mobile:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>item:</i> tes3item|string, <i>itemData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a>, <i>count:</i> number, <i>position:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>, <i>orientation:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>, <i>unknown:</i> boolean)</code></dt>
<dd>

Checks to see if the inventory contains an item. This should not be used, in favor of tes3 APIs.

</dd>
<dt><code class="descname">removeItem({<i>mobile:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string, <i>item:</i> tes3item, <i>itemData:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a>, <i>count:</i> number, <i>deleteItemData:</i> boolean})</code></dt>
<dd>

Removes an item from the inventory directly. This should not be used, in favor of the tes3 API function.

</dd>
<dt><code class="descname">resolveLeveledItems(<i>mobile:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>)</code></dt>
<dd>

Resolves all contained leveled lists and adds the randomized items to the inventory. This should generally not be called directly.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__length</code></dt>
<dd>

Gives the number of elements in the contained iterator.

</dd>
<dt><code class="descname">__pairs</code></dt>
<dd>

A quick access to the elements in the contained iterator.

</dd>
</dl>
