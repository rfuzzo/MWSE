# rayTest

Performs a ray test and returns various information related to the result(s). If findAll is set, the result will be a table of results, otherwise only the first result is returned.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">position: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3|table.html">tes3vector3|table</a></code></dt>
<dd>

Position of the ray origin.

</dd>
<dt><code class="descname">direction: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3|table.html">tes3vector3|table</a></code></dt>
<dd>

Direction of the ray. Does not have to be unit length.

</dd>
<dt><code class="descname">findAll: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the ray test won't stop after the first result.

</dd>
<dt><code class="descname">maxDistance: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The maximum distance that the test will run.

</dd>
<dt><code class="descname">sort: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the results will be sorted by distance from the origin position.

</dd>
<dt><code class="descname">useModelBounds: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, model bounds will be tested for intersection. Otherwise triangles will be used.

</dd>
<dt><code class="descname">useModelCoordinates: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, model coordinates will be used instead of world coordinates.

</dd>
<dt><code class="descname">useBackTriangles: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Include intersections with back-facing triangles.

</dd>
<dt><code class="descname">observeAppCullFlag: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Ignore intersections with culled (hidden) models.

</dd>
<dt><code class="descname">returnColor: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Calculate and return the vertex color at intersections.

</dd>
<dt><code class="descname">returnNormal: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Calculate and return the vertex normal at intersections.

</dd>
<dt><code class="descname">returnSmoothNormal: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Use normal interpolation for calculating vertex normals.

</dd>
<dt><code class="descname">returnTexture: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Calculate and return the texture coordinate at intersections.

</dd>
<dt><code class="descname">ignore: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

An array of references and/or scene graph nodes to cull from the result(s).

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">result: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niPickRecord|table.html">niPickRecord|table</a></code></dt>
<dd>

No description available.

</dd>
</dl>
