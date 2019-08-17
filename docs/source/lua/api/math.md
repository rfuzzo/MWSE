# math

This library is an interface to the standard C math library. It provides all its functions inside the table math.

## Functions

```eval_rst
.. toctree::
    :hidden:

    math/clamp
    math/remap
    math/round
```

<dl class="describe">
<dt><code class="descname"><a href="math/clamp.html">clamp</a>(<i>value:</i> number, <i>min:</i> number, <i>max:</i> number) -> number</code></dt>
<dd>

Returns a value, limited by upper and lower bounds.

</dd>
<dt><code class="descname"><a href="math/remap.html">remap</a>(<i>value:</i> number, <i>lowIn:</i> number, <i>highIn:</i> number, <i>lowOut:</i> number, <i>highOut:</i> number) -> number</code></dt>
<dd>

Returns a value, scaled from expected values [lowIn, highIn] to [lowOut, highOut].

For example, a value of 7 remapped from [0,10] to [0,100] would be 70.

</dd>
<dt><code class="descname"><a href="math/round.html">round</a>(<i>value:</i> number, <i>digits:</i> number) -> number</code></dt>
<dd>

Rounds a number to a given count of digits.

</dd>
</dl>
