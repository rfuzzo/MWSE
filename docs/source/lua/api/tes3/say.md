# say

Plays a sound file, with an optional alteration and subtitle.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

The reference to make say something.

</dd>
<dt><code class="descname">path: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

A path to a valid sound file.

</dd>
<dt><code class="descname">pitch: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A pitch shift to adjust the sound with.

</dd>
<dt><code class="descname">volume: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The volume to play the sound at, relative to the voice mix channel.

</dd>
<dt><code class="descname">forceSubtitle: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true a subtitle will be shown, even if subtitles are disabled.

</dd>
<dt><code class="descname">subtitle: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The subtitle to show if subtitles are enabled, or if forceSubtitle is set.

</dd>
</dl>
