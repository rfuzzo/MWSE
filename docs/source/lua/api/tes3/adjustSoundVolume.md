# adjustSoundVolume

Changes the volume of a sound that is playing on a given reference.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">sound: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3sound|string.html">tes3sound|string</a></code></dt>
<dd>

The sound object, or id of the sound to look for.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

The reference to attach the sound to.

</dd>
<dt><code class="descname">mixChannel: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The channel to base volume off of. Maps to tes3.audioMixType constants.

</dd>
<dt><code class="descname">volume: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A value between 0.0 and 1.0 to scale the volume off of.

</dd>
</dl>
