# tes3cell

An exterior or interior game area.

## Properties

<dl class="describe">
<dt><code class="descname">activators: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3referenceList.html">tes3referenceList</a></code></dt>
<dd>

One of the three reference collections for a cell.

</dd>
<dt><code class="descname">actors: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3referenceList.html">tes3referenceList</a></code></dt>
<dd>

One of the three reference collections for a cell.

</dd>
<dt><code class="descname">ambientColor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3packedColor.html">tes3packedColor</a></code></dt>
<dd>

The cell's ambient color. Only available on interior cells.

</dd>
<dt><code class="descname">behavesAsExterior: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the cell behaves as an exterior instead of an interior for certain properties. Only available on interior cells.

</dd>
<dt><code class="descname">cellFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A numeric representation of the packed bit flags for the cell, typically accessed from other properties.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">fogColor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3packedColor.html">tes3packedColor</a></code></dt>
<dd>

The cell's fog color. Only available on interior cells.

</dd>
<dt><code class="descname">fogDensity: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The cell's fog density. Only available on interior cells.

</dd>
<dt><code class="descname">gridX: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The cell's X grid coordinate. Only available on exterior cells.

</dd>
<dt><code class="descname">gridY: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The cell's Y grid coordinate. Only available on exterior cells.

</dd>
<dt><code class="descname">hasWater: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the cell has water. Only applies to interior cells.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">isInterior: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the cell is an interior.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">name: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The name and id of the cell.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">region: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3region.html">tes3region</a></code></dt>
<dd>

The region associated with the cell. Only available on exterior cells, or interior cells that behave as exterior cells.

</dd>
<dt><code class="descname">restingIsIllegal: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the player may not rest in the cell.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">statics: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3referenceList.html">tes3referenceList</a></code></dt>
<dd>

One of the three reference collections for a cell.

</dd>
<dt><code class="descname">sunColor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3packedColor.html">tes3packedColor</a></code></dt>
<dd>

The cell's sun color. Only available on interior cells.

</dd>
<dt><code class="descname">waterLevel: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The water level in the cell. Only available on interior cells.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">iterateReferences(<i>filter:</i> number)</code></dt>
<dd>

Used in a for loop, iterates over objects in the cell.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
