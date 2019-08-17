# tes3matrix33

A 3 by 3 matrix.

## Properties

<dl class="describe">
<dt><code class="descname">x: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A copy of the first row of the matrix.

</dd>
<dt><code class="descname">y: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A copy of the second row of the matrix.

</dd>
<dt><code class="descname">z: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A copy of the third row of the matrix.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">copy()</code></dt>
<dd>

Creates a copy of the matrix.

</dd>
<dt><code class="descname">fromEulerXYZ(<i>x:</i> number, <i>y:</i> number, <i>z:</i> number)</code></dt>
<dd>

Fills the matrix with values from euler coordinates.

</dd>
<dt><code class="descname">fromEulerZYX(<i>z:</i> number, <i>y:</i> number, <i>x:</i> number)</code></dt>
<dd>

Fills the matrix with values from euler coordinates.

</dd>
<dt><code class="descname">invert()</code></dt>
<dd>

Inverts the matrix.

</dd>
<dt><code class="descname">reorthogonalize()</code></dt>
<dd>

Reorthogonalizes the matrix.

</dd>
<dt><code class="descname">toIdentity()</code></dt>
<dd>

Converts the matrix to the identity matrix's values.

</dd>
<dt><code class="descname">toRotation(<i>angle:</i> number, <i>x:</i> number, <i>y:</i> number, <i>z:</i> number)</code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">toRotationX(<i>x:</i> number)</code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">toRotationY(<i>y:</i> number)</code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">toRotationZ(<i>z:</i> number)</code></dt>
<dd>

No description available.

</dd>
<dt><code class="descname">toZero()</code></dt>
<dd>

Zeroes out all values in the matrix.

</dd>
<dt><code class="descname">transpose()</code></dt>
<dd>

No description available.

</dd>
</dl>
