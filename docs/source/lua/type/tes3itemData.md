# tes3itemData

A set of variables that differentiates one item from another.

## Properties

<dl class="describe">
<dt><code class="descname">charge: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The charge of the item. Provides incorrect values on misc items, which instead have a soul actor.

</dd>
<dt><code class="descname">condition: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The condition/health of the item. Provides incorrect values on light items, which instead have a timeLeft property.

</dd>
<dt><code class="descname">context: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3scriptContext.html">tes3scriptContext</a></code></dt>
<dd>

Returns an ease of use script context for variable access.

</dd>
<dt><code class="descname">data: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A generic lua table that data can be written to, and synced to/from the save. All information stored must be valid for serialization to json.

</dd>
<dt><code class="descname">owner: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3npc|tes3faction|nil.html">tes3npc|tes3faction|nil</a></code></dt>
<dd>

The script associated with the scriptVariables.

</dd>
<dt><code class="descname">requirement: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3globalVariable|number|nil.html">tes3globalVariable|number|nil</a></code></dt>
<dd>

A requirement, typically associated with ownership and when the player may freely interact with an object. The type depends on the owner. Faction owners provide a required rank as a number, while NPCs provide a global variable to check.

</dd>
<dt><code class="descname">script: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3script.html">tes3script</a></code></dt>
<dd>

The script associated with the scriptVariables.

</dd>
<dt><code class="descname">scriptVariables: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3scriptVariables.html">tes3scriptVariables</a></code></dt>
<dd>

Access to the structure where individual mwscript data is stored.

</dd>
<dt><code class="descname">soul: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actor.html">tes3actor</a></code></dt>
<dd>

Only available on misc items. The actor that is stored inside the soul gem.

</dd>
<dt><code class="descname">timeLeft: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The time remaining on a light. Provides incorrect values on non-light items, which instead have a condition property.

</dd>
</dl>
