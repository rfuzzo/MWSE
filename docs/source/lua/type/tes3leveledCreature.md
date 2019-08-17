# tes3leveledCreature

A leveled creature game object.

## Properties

<dl class="describe">
<dt><code class="descname">boundingBox: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3boundingBox.html">tes3boundingBox</a></code></dt>
<dd>

The bounding box for the object.

</dd>
<dt><code class="descname">chanceForNothing: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The percent chance, from 0 to 100, for no object to be chosen.

</dd>
<dt><code class="descname">count: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of possible options in the leveled object container.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">flags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A numerical representation of bit flags for the object.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">list: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

The collection that itself, containing tes3leveledListNodes.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">nextInCollection: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

The next object in parent collection's list.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">owningCollection: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3referenceList.html">tes3referenceList</a></code></dt>
<dd>

The collection responsible for holding this object.

</dd>
<dt><code class="descname">previousInCollection: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

The previous object in parent collection's list.

</dd>
<dt><code class="descname">scale: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The object's scale.

</dd>
<dt><code class="descname">sceneNode: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

The scene graph node for this object.

</dd>
<dt><code class="descname">sceneReference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

The scene graph reference node for this object.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">stolenList: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A list of actors that the object has been stolen from.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">pickFrom()</code></dt>
<dd>

Chooses a random item from the list, based on the player's level.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
