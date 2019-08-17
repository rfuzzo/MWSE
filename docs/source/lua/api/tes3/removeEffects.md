# removeEffects

Removes effects from a given reference. Requires that either the effect or castType parameter be provided.

## Parameters

<dl class="describe">
<dt><code class="descname">castType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Maps to tes3.castType constants.

</dd>
<dt><code class="descname">chance: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The chance for the effect to be removed.

</dd>
<dt><code class="descname">effect: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Maps to tes3.effect constants.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">removeSpell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If removing by cast type, determines if the spell should be removed from the target. Defaults to true if castType is not tes3.castType.spell.

</dd>
</dl>
