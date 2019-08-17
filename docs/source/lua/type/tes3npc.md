# tes3npc

An NPC object that has not been cloned. Typically represents the raw information edited in the construction set.

## Properties

<dl class="describe">
<dt><code class="descname">actorFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A number representing the actor flags. Truly a bit field.

</dd>
<dt><code class="descname">aiConfig: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3aiConfig.html">tes3aiConfig</a></code></dt>
<dd>

A substructure off of actors that contains information on the current AI configuration.

</dd>
<dt><code class="descname">attributes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A table of eight numbers, representing the base values for the actor's attributes.

</dd>
<dt><code class="descname">autoCalc: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor autocalc flag.

</dd>
<dt><code class="descname">barterGold: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's max health.

</dd>
<dt><code class="descname">boundingBox: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3boundingBox.html">tes3boundingBox</a></code></dt>
<dd>

The bounding box for the object.

</dd>
<dt><code class="descname">class: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3class.html">tes3class</a></code></dt>
<dd>

The class that the NPC uses.

</dd>
<dt><code class="descname">cloneCount: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of clones that exist of this actor.

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

The actor's base disposition.

</dd>
<dt><code class="descname">equipment: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

The items currently equipped to the actor.

</dd>
<dt><code class="descname">faction: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3faction.html">tes3faction</a></code></dt>
<dd>

The class that the NPC is joined to.

</dd>
<dt><code class="descname">factionIndex: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">factionRank: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The NPC's rank in their faction.

</dd>
<dt><code class="descname">fatigue: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's max fatigue.

</dd>
<dt><code class="descname">female: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Direct access to the actor female flag.

</dd>
<dt><code class="descname">hair: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3bodyPart.html">tes3bodyPart</a></code></dt>
<dd>

The hair body part that the NPC will use.

</dd>
<dt><code class="descname">head: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3bodyPart.html">tes3bodyPart</a></code></dt>
<dd>

The head body part that the NPC will use.

</dd>
<dt><code class="descname">health: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's max health.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">inventory: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

The items currently carried by the actor.

</dd>
<dt><code class="descname">isAttacked: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the actor's attacked flag is set.

</dd>
<dt><code class="descname">isEssential: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the actor's essential flag is set.

</dd>
<dt><code class="descname">isInstance: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Always returns false.

</dd>
<dt><code class="descname">isRespawn: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the actor's respawn flag is set.

</dd>
<dt><code class="descname">level: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's level.

</dd>
<dt><code class="descname">magicka: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's max magicka.

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
<dt><code class="descname">race: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3race.html">tes3race</a></code></dt>
<dd>

The race that the NPC uses.

</dd>
<dt><code class="descname">reputation: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The actor's base reputation.

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
<dt><code class="descname">skills: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A table of twenty seven numbers, representing the base values for the NPC's skills.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">spells: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3spellList.html">tes3spellList</a></code></dt>
<dd>

A list of spells that the actor has access to.

</dd>
<dt><code class="descname">stolenList: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A list of actors that the object has been stolen from.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">onInventoryClose(<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>)</code></dt>
<dd>

A callback function invoked when an inventory is closed. Typically not used outside of specific purposes.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
