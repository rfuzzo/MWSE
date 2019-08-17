# tes3race

A core object representing a character race.

## Properties

<dl class="describe">
<dt><code class="descname">baseAttributes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

Array-style table access to base 8 attributes for the race. Each element in the array is a tes3raceBaseAttribute.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">femaleBody: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3raceBodyParts.html">tes3raceBodyParts</a></code></dt>
<dd>

Access to all the body parts that will be used for female actors of this race.

</dd>
<dt><code class="descname">flags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Raw bit-based flags.

</dd>
<dt><code class="descname">height: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3raceHeightWeight.html">tes3raceHeightWeight</a></code></dt>
<dd>

Access to the the height pair for males/females of the race.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">maleBody: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3raceBodyParts.html">tes3raceBodyParts</a></code></dt>
<dd>

Access to all the body parts that will be used for male actors of this race.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">name: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The player-facing name for the object.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">skillBonuses: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

Array-style table access for 7 skill bonuses for the race. Each element in the array is a tes3raceSkillBonus.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">weight: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3raceHeightWeight.html">tes3raceHeightWeight</a></code></dt>
<dd>

Access to the the height pair for males/females of the race.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
