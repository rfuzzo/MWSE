# playAnimation

Plays a given animation group. Optional flags can be used to define how the group starts.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor|tes3reference|string.html">tes3mobileActor|tes3reference|string</a></code></dt>
<dd>

The reference that will play the animation.

</dd>
<dt><code class="descname">group: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The group id -- a value from 0 to 149. Maps to tes3.animationGroup.* constants.

</dd>
<dt><code class="descname">startFlag: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A flag for starting the group with, matching tes3.animationStartFlag.* constants.

</dd>
<dt><code class="descname">loopCount: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

If provided, the animation will loop a given number of times.

</dd>
</dl>
