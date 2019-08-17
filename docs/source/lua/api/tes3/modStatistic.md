# modStatistic

Modifies a statistic on a given actor. This should be used instead of manually setting values on the game structures, to ensure that events and GUI elements are properly handled. Either skill, attribute, or name must be provided.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">attribute: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The attribute to set.

</dd>
<dt><code class="descname">base: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

If set, the base value will be modified.

</dd>
<dt><code class="descname">current: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

If set, the current value will be modified.

</dd>
<dt><code class="descname">limit: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If set, the attribute won't rise above 100 or fall below 0.

</dd>
<dt><code class="descname">name: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

A generic name of an attribute to set.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor|tes3reference|string.html">tes3mobileActor|tes3reference|string</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">skill: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The skill to set.

</dd>
<dt><code class="descname">value: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

If set, both the base and current value will be modified.

</dd>
</dl>
