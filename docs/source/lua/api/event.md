# event

The event library helps to instruct mwse to call a given function when a specific action is taken in the game.

## Functions

```eval_rst
.. toctree::
    :hidden:

    event/clear
    event/register
    event/trigger
    event/unregister
```

<dl class="describe">
<dt><code class="descname"><a href="event/clear.html">clear</a>(<i>eventId:</i> string, <i>options:</i> table)</code></dt>
<dd>

Removes all callbacks registered for a given event.

</dd>
<dt><code class="descname"><a href="event/register.html">register</a>(<i>eventId:</i> string, <i>callback:</i> function, <i>options:</i> table)</code></dt>
<dd>

Registers a function to be called when an event is raised.

</dd>
<dt><code class="descname"><a href="event/trigger.html">trigger</a>(<i>eventId:</i> string, <i>payload:</i> table, <i>options:</i> table)</code></dt>
<dd>

Triggers an event. This can be used to trigger custom events with specific data.

</dd>
<dt><code class="descname"><a href="event/unregister.html">unregister</a>(<i>eventId:</i> string, <i>callback:</i> function, <i>options:</i> table)</code></dt>
<dd>

Unregisters a function  event is raised.

</dd>
</dl>
