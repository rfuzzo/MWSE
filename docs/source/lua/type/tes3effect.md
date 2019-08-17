# tes3effect

A structure that defines information for an effect and its associated variables, typically found on spells, alchemy, and enchantments.

## Properties

<dl class="describe">
<dt><code class="descname">attribute: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The attribute associated with this effect, or -1 if no attribute is used.

</dd>
<dt><code class="descname">duration: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

How long the effect should last.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The base tes3magicEffect ID that the effect uses.

</dd>
<dt><code class="descname">max: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The maximum magnitude of the effect.

</dd>
<dt><code class="descname">min: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The minimum magnitude of the effect.

</dd>
<dt><code class="descname">object: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3magicEffect.html">tes3magicEffect</a></code></dt>
<dd>

Fetches the tes3magicEffect for the given id used.

</dd>
<dt><code class="descname">radius: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The radius of the effect.

</dd>
<dt><code class="descname">rangeType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Determines if the effect is self, touch, or target ranged.

</dd>
<dt><code class="descname">skill: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The skill associated with this effect, or -1 if no skill is used.

</dd>
</dl>
