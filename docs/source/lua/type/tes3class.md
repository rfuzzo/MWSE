# tes3class

A core object representing a character class.

## Properties

<dl class="describe">
<dt><code class="descname">attributes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

An array-style table of the two attribute IDs associated with the class.

</dd>
<dt><code class="descname">bartersAlchemy: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter alchemy items.

</dd>
<dt><code class="descname">bartersApparatus: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter apparatus items.

</dd>
<dt><code class="descname">bartersArmor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter armor items.

</dd>
<dt><code class="descname">bartersBooks: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter book items.

</dd>
<dt><code class="descname">bartersClothing: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter clothing items.

</dd>
<dt><code class="descname">bartersEnchantedItems: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter enchanted items.

</dd>
<dt><code class="descname">bartersIngredients: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter ingredient items.

</dd>
<dt><code class="descname">bartersLights: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter light items.

</dd>
<dt><code class="descname">bartersLockpicks: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter lockpick items.

</dd>
<dt><code class="descname">bartersMiscItems: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter misc items.

</dd>
<dt><code class="descname">bartersProbes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter probe items.

</dd>
<dt><code class="descname">bartersRepairTools: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter repair items.

</dd>
<dt><code class="descname">bartersWeapons: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will barter weapon items.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">description: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

Loads from disk and returns the description of the class.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">majorSkills: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

An array-style table of the 5 skills IDs associated with the class' major skills.

</dd>
<dt><code class="descname">minorSkills: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

An array-style table of the 5 skills IDs associated with the class' major skills.

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
<dt><code class="descname">offersEnchanting: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will offer repair services.

</dd>
<dt><code class="descname">offersRepairs: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will offer enchanting services.

</dd>
<dt><code class="descname">offersSpellmaking: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will offer spellmaking services.

</dd>
<dt><code class="descname">offersSpells: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will offer spell selling services.

</dd>
<dt><code class="descname">offersTraining: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class will offer spell training services.

</dd>
<dt><code class="descname">playable: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the class is selectable at character generation.

</dd>
<dt><code class="descname">services: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The services offered by the class. This is a bit field, and its values should typically be accessed through values such as bartersAlchemy.

</dd>
<dt><code class="descname">skills: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

An array-style table of the 10 skills IDs associated with the class. For major or minor skills specifically, use the majorSkills and MinorSkills properties.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">specialization: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The specialization for the class. Maps to the tes3.specialization table.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
