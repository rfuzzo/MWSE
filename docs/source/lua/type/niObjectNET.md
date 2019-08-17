# niObjectNET

An object that has a name, extra data, and controllers.

## Properties

<dl class="describe">
<dt><code class="descname">name: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The human-facing name of the given object.

</dd>
<dt><code class="descname">references: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The number of references that exist for the given object. When this value hits zero, the object's memory is freed.

</dd>
<dt><code class="descname">runTimeTypeInformation: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niRTTI.html">niRTTI</a></code></dt>
<dd>

The runtime type information for this object.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">clone()</code></dt>
<dd>

Creates a copy of this object.

</dd>
<dt><code class="descname">isInstanceOfType(<i>type:</i> number) -> boolean</code></dt>
<dd>

Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.

</dd>
<dt><code class="descname">isOfType(<i>type:</i> number) -> boolean</code></dt>
<dd>

Determines if the object is of a given type. Types can be found in the tes3.niType table.

</dd>
<dt><code class="descname">prependController(<i>type:</i> niTimeController)</code></dt>
<dd>

Add a controller to the object as the first controller.

</dd>
<dt><code class="descname">removeAllControllers()</code></dt>
<dd>

Removes all controllers.

</dd>
<dt><code class="descname">removeController(<i>type:</i> niTimeController)</code></dt>
<dd>

Removes a controller from the object.

</dd>
</dl>
