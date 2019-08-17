# tes3nonDynamicData

A child container from tes3dataHandler, where game data is stored.

## Properties

<dl class="describe">
<dt><code class="descname">cells: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3stlList.html">tes3stlList</a></code></dt>
<dd>

A collection of all cell objects.

</dd>
<dt><code class="descname">classes: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all class objects.

</dd>
<dt><code class="descname">dialogues: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all dialogue objects.

</dd>
<dt><code class="descname">factions: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all faction objects.

</dd>
<dt><code class="descname">globals: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all global variable objects.

</dd>
<dt><code class="descname">magicEffects: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A table of references to all 143 magic effects.

</dd>
<dt><code class="descname">objects: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3linkedList.html">tes3linkedList</a></code></dt>
<dd>

A collection of all other game objects.

</dd>
<dt><code class="descname">races: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all race objects.

</dd>
<dt><code class="descname">regions: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all region objects.

</dd>
<dt><code class="descname">scripts: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all script objects.

</dd>
<dt><code class="descname">skills: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A table of references to all 27 skills.

</dd>
<dt><code class="descname">soundGenerators: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all sound generator objects.

</dd>
<dt><code class="descname">sounds: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all sound objects.

</dd>
<dt><code class="descname">spells: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3linkedList.html">tes3linkedList</a></code></dt>
<dd>

A collection of all spell objects.

</dd>
<dt><code class="descname">startScripts: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iterator.html">tes3iterator</a></code></dt>
<dd>

A collection of all tes3startScript objects.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">addNewObject(<i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3baseObject.html">tes3baseObject</a>) -> boolean</code></dt>
<dd>

Inserts a newly created object into the proper collections.

</dd>
<dt><code class="descname">deleteObject(<i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3baseObject.html">tes3baseObject</a>)</code></dt>
<dd>

Removes an object from the proper collections.

</dd>
<dt><code class="descname">findDialogue(<i>id:</i> string) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a></code></dt>
<dd>

Locates a dialogue for a given ID.

</dd>
<dt><code class="descname">findFirstCloneOfActor(<i>id:</i> string) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Locates the first reference for a given object ID.

</dd>
<dt><code class="descname">findGlobalVariable(<i>id:</i> string) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3globalVariable.html">tes3globalVariable</a></code></dt>
<dd>

Locates a global variable for a given ID.

</dd>
<dt><code class="descname">findScript(<i>id:</i> string) -> tes3script</code></dt>
<dd>

Locates a script for a given ID.

</dd>
<dt><code class="descname">findSound(<i>id:</i> string) -> tes3sound</code></dt>
<dd>

Locates a sound for a given ID.

</dd>
<dt><code class="descname">resolveObject(<i>id:</i> string) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3baseObject.html">tes3baseObject</a></code></dt>
<dd>

Locates a general object for a given ID.

</dd>
</dl>
