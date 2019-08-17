# tes3mobileObject

The base object from which all other mobiles (AI/movement using) structures derive.

## Properties

<dl class="describe">
<dt><code class="descname">boundSize: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that shows the size of the bounding box in each direction.

</dd>
<dt><code class="descname">cellX: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The X grid coordinate of the cell the mobile is in.

</dd>
<dt><code class="descname">cellY: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The Y grid coordinate of the cell the mobile is in.

</dd>
<dt><code class="descname">flags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the root mobile object flags, represented as an integer. Should not be accessed directly.

</dd>
<dt><code class="descname">height: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The height of the mobile above the ground.

</dd>
<dt><code class="descname">impulseVelocity: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that represents the 3D acceleration of the object.

</dd>
<dt><code class="descname">movementFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the root mobile object movement flags, represented as an integer. Should not be accessed directly.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of mobile object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">position: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that represents the 3D position of the object.

</dd>
<dt><code class="descname">prevMovementFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the root mobile object movement flags from the previous frame, represented as an integer. Should not be accessed directly.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Access to the reference object for the mobile, if any.

</dd>
<dt><code class="descname">velocity: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

A vector that represents the 3D velocity of the object.

</dd>
</dl>
