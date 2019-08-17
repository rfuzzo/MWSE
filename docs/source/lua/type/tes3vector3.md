# tes3vector3

A simple trio of floating-point numbers.

## Properties

<dl class="describe">
<dt><code class="descname">b: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The third value in the vector. An alias for z.

</dd>
<dt><code class="descname">g: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The second value in the vector. An alias for y.

</dd>
<dt><code class="descname">r: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The first value in the vector. An alias for x.

</dd>
<dt><code class="descname">x: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The first value in the vector.

</dd>
<dt><code class="descname">y: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The second value in the vector.

</dd>
<dt><code class="descname">z: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The third value in the vector.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">copy()</code></dt>
<dd>

Creates a copy of the vector.

</dd>
<dt><code class="descname">cross(<i>vec:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

Calculates the cross product with another vector.

</dd>
<dt><code class="descname">distance(<i>vec:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>) -> number</code></dt>
<dd>

Calculates the distance to another vector.

</dd>
<dt><code class="descname">dot(<i>vec:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

Calculates the dot product with another vector.

</dd>
<dt><code class="descname">heightDifference(<i>vec:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>) -> number</code></dt>
<dd>

Calculates the vertical distance to another vector.

</dd>
<dt><code class="descname">length()</code></dt>
<dd>

Calculates the length of the vector.

</dd>
<dt><code class="descname">negate()</code></dt>
<dd>

Negates all values in the vector.

</dd>
<dt><code class="descname">normalize()</code></dt>
<dd>

Normalize the vector in-place, or set its components to zero if normalization is not possible. Returns true if the vector was successfully normalized.

</dd>
<dt><code class="descname">normalized()</code></dt>
<dd>

Get a normalized copy of the vector.

</dd>
<dt><code class="descname">outerProduct(<i>vec:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>) -> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3matrix33.html">tes3matrix33</a></code></dt>
<dd>

Calculates the outer product with another vector.

</dd>
</dl>
