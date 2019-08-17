# tes3misc

A core miscellaneous object.

## Properties

<dl class="describe">
<dt><code class="descname">boundingBox: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3boundingBox.html">tes3boundingBox</a></code></dt>
<dd>

The bounding box for the object.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">icon: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The path to the object's icon.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">isKey: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the flag determining if this item is recognized as a key.

</dd>
<dt><code class="descname">isSoulGem: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Determines if this item is a soul gem.

</dd>
<dt><code class="descname">mesh: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The path to the object's mesh.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">name: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The player-facing name for the object.

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
<dt><code class="descname">script: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3script.html">tes3script</a></code></dt>
<dd>

The script that runs on the object.

</dd>
<dt><code class="descname">soulGemData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3soulGemData.html">tes3soulGemData</a></code></dt>
<dd>

Fetches related soul gem data, if this item is a soul gem.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">stolenList: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A list of actors that the object has been stolen from.

</dd>
<dt><code class="descname">value: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The value of the object.

</dd>
<dt><code class="descname">weight: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The weight, in pounds, of the object.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
