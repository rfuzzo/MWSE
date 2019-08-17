# tes3magicSourceInstance

A game structure that keeps track of a magic source on an object.

## Properties

<dl class="describe">
<dt><code class="descname">castChanceOverride: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">caster: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">item: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3item.html">tes3item</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">itemData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3itemData.html">tes3itemData</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">itemID: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">magicID: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">projectile: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileProjectile.html">tes3mobileProjectile</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">source: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3alchemy|tes3enchantment|tes3spell.html">tes3alchemy|tes3enchantment|tes3spell</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">sourceType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Shows if the source is a spell, enchantment, or alchemy.

</dd>
<dt><code class="descname">state: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Shows if the state is pre-cast, cast, beginning, working, ending, retired, etc.

</dd>
<dt><code class="descname">target: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">timestampCastBegin: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">getMagnitudeForIndex(<i>index:</i> number) -> number</code></dt>
<dd>

Gets the magnitude from the casting source for a given effect index.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
