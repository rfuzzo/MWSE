# removeSound

Stops a sound playing. Without a reference, it will match unattached sounds. With a reference, it will only match a sound playing on that specific reference.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">sound: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3sound|string.html">tes3sound|string</a></code></dt>
<dd>

The sound object, or id of the sound to look for.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

The reference the sound is attached to.

</dd>
</dl>
