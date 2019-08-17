# createReference

Similar to mwscript's PlaceAtPC or PlaceAtMe, this creates a new reference in the game world.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">object: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3physicalObject|string.html">tes3physicalObject|string</a></code></dt>
<dd>

The object to create a reference of.

</dd>
<dt><code class="descname">position: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3|table.html">tes3vector3|table</a></code></dt>
<dd>

The location to create the reference at.

</dd>
<dt><code class="descname">orientation: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3|table.html">tes3vector3|table</a></code></dt>
<dd>

The new orientation for the created reference.

</dd>
<dt><code class="descname">cell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell|string|table.html">tes3cell|string|table</a></code></dt>
<dd>

The cell to create the reference in. This is only needed for interior cells.

</dd>
<dt><code class="descname">scale: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A scale for the reference.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">newReference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

No description available.

</dd>
</dl>
