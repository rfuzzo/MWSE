# timer

The timer library provides helper functions for creating delayed executors.

## Values

<dl class="describe">
<dt><code class="descname">active: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Constant to represent a timer that is actively running.

</dd>
<dt><code class="descname">expired: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Constant to represent a timer that has completed.

</dd>
<dt><code class="descname">game: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Constant to represent timers that run based on in-world time.

</dd>
<dt><code class="descname">paused: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Constant to represent a timer that is paused.

</dd>
<dt><code class="descname">real: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Constant to represent timers that run in real-time.

</dd>
<dt><code class="descname">simulate: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Constant to represent timers that run when the game isn't paused.

</dd>
</dl>

## Functions

```eval_rst
.. toctree::
    :hidden:

    timer/delayOneFrame
    timer/start
```

<dl class="describe">
<dt><code class="descname"><a href="timer/delayOneFrame.html">delayOneFrame</a>(<i>callback:</i> function, <i>type:</i> number) -> <i>timer:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer.html">mwseTimer</a></code></dt>
<dd>

Creates a timer that will finish the next frame. It defaults to the next simulation frame.

</dd>
<dt><code class="descname"><a href="timer/start.html">start</a>({<i>type:</i> number, <i>duration:</i> number, <i>callback:</i> function, <i>iterations:</i> number}) -> <i>timer:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/mwseTimer.html">mwseTimer</a></code></dt>
<dd>

Creates a timer.

</dd>
</dl>
