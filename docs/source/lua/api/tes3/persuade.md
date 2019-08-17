# persuade

Attempts a persuasion attempt on an actor, potentially adjusting their disposition. Returns true if the attempt was a success.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">actor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor|tes3reference|string.html">tes3mobileActor|tes3reference|string</a></code></dt>
<dd>

The actor to try to persuade.

</dd>
<dt><code class="descname">index: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

If an index is provided, 0-indexed with the following results: admire, intimidate, taunt, bribe (10), bribe (100), bribe (1000).

</dd>
<dt><code class="descname">modifier: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

If no index is provided, this is the direct modifier to try.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">success: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

No description available.

</dd>
</dl>
