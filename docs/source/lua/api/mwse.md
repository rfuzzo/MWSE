# mwse

The mwse library provides methods for interacting with MWSE itself, rather than direct TES3 objects.

## Values

<dl class="describe">
<dt><code class="descname">buildDate: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A numerical representation of the date that version of MWSE currently being used was built on.

Formatted as YYYYMMDD.

</dd>
<dt><code class="descname">gameTimers: <a href="https://mwse.readthedocs.io/en/latest/lua/type/mwseTimerController.html">mwseTimerController</a></code></dt>
<dd>

The mwseTimerController responsible for game-type timers.

</dd>
<dt><code class="descname">realTimers: <a href="https://mwse.readthedocs.io/en/latest/lua/type/mwseTimerController.html">mwseTimerController</a></code></dt>
<dd>

The mwseTimerController responsible for real-type timers.

</dd>
<dt><code class="descname">simulateTimers: <a href="https://mwse.readthedocs.io/en/latest/lua/type/mwseTimerController.html">mwseTimerController</a></code></dt>
<dd>

The mwseTimerController responsible for simulate-type timers.

</dd>
<dt><code class="descname">stack: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

The stack library provides functions to interact with the mwse mwscript stack, for dealing with custom mwscript extensions.

</dd>
<dt><code class="descname">string: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

The mwse string library provides functions for interacting with mwscript string storage.

</dd>
<dt><code class="descname">version: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

A numerical representation of the release version of MWSE currently being used.

Formatted as AAABBBCCC, where A is the major version, BBB is the minor version, and CCC is the patch version. BBB and CCC are forward-padded.

It is usually better to use mwse.buildDate instead.

</dd>
</dl>

## Functions

```eval_rst
.. toctree::
    :hidden:

    mwse/getVersion
    mwse/getVirtualMemoryUsage
    mwse/loadConfig
    mwse/log
    mwse/longToString
    mwse/overrideScript
    mwse/saveConfig
    mwse/stringToLong
```

<dl class="describe">
<dt><code class="descname"><a href="mwse/getVersion.html">getVersion</a>()</code></dt>
<dd>

Equivalent to mwse.version.

</dd>
<dt><code class="descname"><a href="mwse/getVirtualMemoryUsage.html">getVirtualMemoryUsage</a>()</code></dt>
<dd>

Returns the amount of memory used, in bytes.

</dd>
<dt><code class="descname"><a href="mwse/loadConfig.html">loadConfig</a>(<i>fileName:</i> string) -> table|nil</code></dt>
<dd>

Loads a config table from Data Files\MWSE\config\{fileName}.json.

</dd>
<dt><code class="descname"><a href="mwse/log.html">log</a>(<i>message:</i> string, <i>arg2:</i> variadic)</code></dt>
<dd>

This function writes information to the MWSELog.txt file in the user's installation directory.

The message accepts formatting and additional parameters matching string.format's usage.

</dd>
<dt><code class="descname"><a href="mwse/longToString.html">longToString</a>(<i>type:</i> number) -> string</code></dt>
<dd>

Converts a TES3 object type (e.g. from tes3.objectType) into an uppercase, 4-character string.

</dd>
<dt><code class="descname"><a href="mwse/overrideScript.html">overrideScript</a>(<i>scriptId:</i> string, <i>callback:</i> function) -> boolean</code></dt>
<dd>

Configures MWSE to execute a given function instead when a script would run.

</dd>
<dt><code class="descname"><a href="mwse/saveConfig.html">saveConfig</a>(<i>fileName:</i> string, <i>object:</i> any, <i>config:</i> table) -> table</code></dt>
<dd>

Saves a config table to Data Files\MWSE\config\{fileName}.json.

</dd>
<dt><code class="descname"><a href="mwse/stringToLong.html">stringToLong</a>(<i>tag:</i> string) -> number</code></dt>
<dd>

Converts an uppercase, 4-character string into a TES3 object type.

</dd>
</dl>
