# tes3iterator

A collection that can be iterated over Contains items in a simple linked list, and stores its head/tail.

## Properties

<dl class="describe">
<dt><code class="descname">current: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iteratorNode.html">tes3iteratorNode</a></code></dt>
<dd>

A reference for the currently iterated node. This is used by the core game engine, but should not be accessed from lua.

</dd>
<dt><code class="descname">head: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iteratorNode.html">tes3iteratorNode</a></code></dt>
<dd>

The first node in the collection.

</dd>
<dt><code class="descname">size: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The amount of items in the iterator.

</dd>
<dt><code class="descname">tail: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3iteratorNode.html">tes3iteratorNode</a></code></dt>
<dd>

The last node in the collection.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__index</code></dt>
<dd>

An element can be accessed using its numerical index in the collection.

</dd>
<dt><code class="descname">__length</code></dt>
<dd>

The length operator fetches the number of elements in the collection.

</dd>
<dt><code class="descname">__pairs</code></dt>
<dd>

Elements in the collection can be iterated over using pairs. The first object is the node, the second is the value itself.

</dd>
</dl>
