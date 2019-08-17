# tes3dataHandler

A core game object used for storing both active and non-dynamic gameplay data.

## Properties

<dl class="describe">
<dt><code class="descname">backgroundThread: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A Windows handle to the background processing thread.

</dd>
<dt><code class="descname">backgroundThreadId: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The thread ID for the background processing thread.

</dd>
<dt><code class="descname">backgroundThreadRunning: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Access to the running state for the background processing thread.

</dd>
<dt><code class="descname">cellChanged: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

A flag set for the frame that the player has changed cells.

</dd>
<dt><code class="descname">centralGridX: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The position of the origin horizontal grid coordinate.

</dd>
<dt><code class="descname">centralGridY: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The position of the origin longitudinal grid coordinate.

</dd>
<dt><code class="descname">currentCell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

Access to the cell that the player is currently in.

</dd>
<dt><code class="descname">currentInteriorCell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

Access to the current interior cell, if the player is in an interior.

</dd>
<dt><code class="descname">exteriorCells: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A table of nine tes3cellExteriorData objects for any loaded exterior cells.

</dd>
<dt><code class="descname">lastExteriorCell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

Access to the last visited exterior cell.

</dd>
<dt><code class="descname">mainThread: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A Windows handle to the main execution thread.

</dd>
<dt><code class="descname">mainThreadId: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The thread ID for the main execution thread.

</dd>
<dt><code class="descname">nonDynamicData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3nonDynamicData.html">tes3nonDynamicData</a></code></dt>
<dd>

A child structure where core game objects are held.

</dd>
<dt><code class="descname">threadSleepTime: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">worldObjectRoot: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

One of the core parent scene graph nodes.

</dd>
<dt><code class="descname">worldPickLandscapeRoot: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

One of the core parent scene graph nodes.

</dd>
<dt><code class="descname">worldPickObjectRoot: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

One of the core parent scene graph nodes.

</dd>
</dl>
