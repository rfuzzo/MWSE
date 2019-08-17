# tes3dialogue

A parent-level dialogue, such as a topic, voice, greeting, persuasion response, or journal.

## Properties

<dl class="describe">
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">info: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of individual entries in the dialogue.

</dd>
<dt><code class="descname">journalIndex: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

For journal dialogues, the currently active journal index.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">type: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of the dialogue.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">addToJournal({<i>index:</i> number, <i>actor:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string}) -> boolean</code></dt>
<dd>

Adds the dialogue to the player's journal, if applicable, at a given index.

</dd>
<dt><code class="descname">getInfo({<i>actor:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|string}) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogueInfo.html">tes3dialogueInfo</a></code></dt>
<dd>

Fetches the info that a given actor would produce for the dialogue.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
