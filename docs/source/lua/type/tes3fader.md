# tes3fader

An object that applies a graphical effect on the screen, such as screen glare or damage coloring.

## Properties

<dl class="describe">
<dt><code class="descname">active: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The activation state for the fader. Setting this effectively calls activate/deactivate.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">activate()</code></dt>
<dd>

Activates a deactivated fader.

</dd>
<dt><code class="descname">deactivate()</code></dt>
<dd>

Deactivates an activated fader.

</dd>
<dt><code class="descname">fadeIn({<i>duration:</i> number})</code></dt>
<dd>

Transitions the fader to a value of 1 over a given duration.

</dd>
<dt><code class="descname">fadeOut({<i>duration:</i> number})</code></dt>
<dd>

Transitions the fader to a value of 0 over a given duration.

</dd>
<dt><code class="descname">fadeTo({<i>value:</i> number, <i>duration:</i> number})</code></dt>
<dd>

Transitions the fader to a value over a given duration.

</dd>
<dt><code class="descname">removeMaterialProperty(<i>value:</i> number)</code></dt>
<dd>

Updates the fader for the current frame.

</dd>
<dt><code class="descname">setColor({<i>color:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a>|table, <i>flag:</i> boolean}) -> boolean</code></dt>
<dd>

Applies a coloring effect to the fader.

</dd>
<dt><code class="descname">setTexture(<i>path:</i> string)</code></dt>
<dd>

Updates the fader for the current frame.

</dd>
<dt><code class="descname">update()</code></dt>
<dd>

Updates the fader for the current frame.

</dd>
</dl>

## Functions

<dl class="describe">
<dt><code class="descname">new()</code></dt>
<dd>

Creates a new fader, and adds it to the fader system.

</dd>
</dl>
