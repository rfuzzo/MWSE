# start

Creates a timer.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">type: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Defaults to timer.simulate.

</dd>
<dt><code class="descname">duration: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Duration of the timer. The method of time passing depends on the timer type.

</dd>
<dt><code class="descname">callback()</code></dt>
<dd>

The callback function that will execute when the timer expires.

</dd>
<dt><code class="descname">iterations: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The number of iterations to run.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">timer: <a href="https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer.html">mwseTimer</a></code></dt>
<dd>

No description available.

</dd>
</dl>
