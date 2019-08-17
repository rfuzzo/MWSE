# tes3magicEffect

A core magic effect definition.

## Properties

<dl class="describe">
<dt><code class="descname">allowEnchanting: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the flag that determines if this effect can be used in enchanting.

</dd>
<dt><code class="descname">allowSpellmaking: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the flag that determines if this effect can be used with spellmaking.

</dd>
<dt><code class="descname">appliesOnce: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect can be used in enchanting.

</dd>
<dt><code class="descname">areaSoundEffect: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The sound path to the sound effect to use for area of effect impacts.

</dd>
<dt><code class="descname">baseFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">baseMagickaCost: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The base magicka cost to use in calculations.

</dd>
<dt><code class="descname">boltSoundEffects: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The sound path to the sound effect to use for target projectiles.

</dd>
<dt><code class="descname">canCastSelf: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect can be used with a range of self.

</dd>
<dt><code class="descname">canCastTarget: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect can be used with a range of target.

</dd>
<dt><code class="descname">canCastTouch: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect can be used with a range of touch.

</dd>
<dt><code class="descname">castSoundEffect: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The sound path to the sound effect to use when casting.

</dd>
<dt><code class="descname">casterLinked: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag.

</dd>
<dt><code class="descname">flags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Raw access to the numerical representation of flags. Typically shouldn't be used.

</dd>
<dt><code class="descname">hasContinuousVFX: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect's VFX continuously plays.

</dd>
<dt><code class="descname">hasNoDuration: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect doesn't use a duration.

</dd>
<dt><code class="descname">hasNoMagnitude: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect doesn't make use of its magnitude.

</dd>
<dt><code class="descname">hitSoundEffect: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The sound path to the sound effect to use when the effect hits a target.

</dd>
<dt><code class="descname">icon: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The sound path to the icon to use for the effect.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The numerical id for the effect.

</dd>
<dt><code class="descname">illegalDaedra: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect summons an illegal daedra. This flag isn't used.

</dd>
<dt><code class="descname">isHarmful: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect is counted as a hostile action.

</dd>
<dt><code class="descname">lightingBlue: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The amount of blue lighting to use when lighting projectiles.

</dd>
<dt><code class="descname">lightingGreen: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The amount of green lighting to use when lighting projectiles.

</dd>
<dt><code class="descname">lightingRed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The amount of red lighting to use when lighting projectiles.

</dd>
<dt><code class="descname">nonRecastable: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect can be refreshed by recasting.

</dd>
<dt><code class="descname">particleTexture: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The path to use for the particle effect texture.

</dd>
<dt><code class="descname">school: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The school that the effect is associated with.

</dd>
<dt><code class="descname">size: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">sizeCap: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">speed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">targetsAttributes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect makes use of attributes.

</dd>
<dt><code class="descname">targetsSkills: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect makes use of skills.

</dd>
<dt><code class="descname">unreflectable: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect can't be reflected.

</dd>
<dt><code class="descname">usesNegativeLighting: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the base flag that determines if this effect provides negative lighting.

</dd>
</dl>
