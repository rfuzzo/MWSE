# tes3dialogueInfo

A child for a given dialogue. Whereas a dialogue may be a conversation topic, a tes3dialogueInfo would be an individual response.

## Properties

<dl class="describe">
<dt><code class="descname">actor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actor.html">tes3actor</a></code></dt>
<dd>

The speaker's actor that the info is filtered for.

</dd>
<dt><code class="descname">cell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

The speaker's current cell that the info is filtered for.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">disposition: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The minimum disposition that the info is filtered for.

</dd>
<dt><code class="descname">firstHeardFrom: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actor.html">tes3actor</a></code></dt>
<dd>

The actor that the player first heard the info from.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique long string ID for the info. This is not kept in memory, and must be loaded from files for each call.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">npcClass: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3class.html">tes3class</a></code></dt>
<dd>

The speaker's class that the info is filtered for.

</dd>
<dt><code class="descname">npcFaction: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3faction.html">tes3faction</a></code></dt>
<dd>

The speaker's faction that the info is filtered for.

</dd>
<dt><code class="descname">npcRace: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actor.html">tes3actor</a></code></dt>
<dd>

The speaker's race that the info is filtered for.

</dd>
<dt><code class="descname">npcRank: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The speaker's faction rank that the info is filtered for.

</dd>
<dt><code class="descname">npcSex: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The speaker's sex that the info is filtered for.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">pcFaction: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The player's joined faction that the info is filtered for.

</dd>
<dt><code class="descname">pcRank: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The player's rank required rank in the speaker's faction.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">text: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

String contents for the info. This is not kept in memory, and must be loaded from files for each call.

</dd>
<dt><code class="descname">type: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of the info.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
