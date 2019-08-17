# tes3gameFile

Represents a loaded ESM, ESP, or ESS file.

## Properties

<dl class="describe">
<dt><code class="descname">author: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The file's author.

</dd>
<dt><code class="descname">cellName: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The current cell, from a save game.

</dd>
<dt><code class="descname">currentHealth: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The player's health, from a save game.

</dd>
<dt><code class="descname">day: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The current day, from a save game.

</dd>
<dt><code class="descname">daysPassed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of days passed, from a save game.

</dd>
<dt><code class="descname">description: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The description of the file.

</dd>
<dt><code class="descname">fileSize: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The size of the file.

</dd>
<dt><code class="descname">filename: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The simple filename.

</dd>
<dt><code class="descname">gameHour: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The current game hour, from a save game.

</dd>
<dt><code class="descname">masters: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

An array-style table of the tes3gameFiles that this is dependent upon.

</dd>
<dt><code class="descname">maxHealth: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The player's maximum health, from a save game.

</dd>
<dt><code class="descname">modifiedTime: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The timestamp that the file was modified.

</dd>
<dt><code class="descname">month: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The current month, from a save game.

</dd>
<dt><code class="descname">path: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The path to the file.

</dd>
<dt><code class="descname">playerName: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The player's name, from a save game.

</dd>
<dt><code class="descname">year: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The current year, from a save game.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">deleteFile()</code></dt>
<dd>

Deletes the file.

</dd>
</dl>
