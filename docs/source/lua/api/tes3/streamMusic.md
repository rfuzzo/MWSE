# streamMusic

This function interrupts the current music to play the specified music track.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">path: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

Path to the music file, relative to Data Files/music/.

</dd>
<dt><code class="descname">situation: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Determines what kind of gameplay situation the music should stay active for. Explore music plays during non-combat, and ends when combat starts. Combat music starts during combat, and ends when combat ends. Uninterruptible music always plays, ending only when the track does.

</dd>
<dt><code class="descname">crossfade: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The duration in seconds of the crossfade from the old to the new track. The default is 1.0.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">executed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

No description available.

</dd>
</dl>
