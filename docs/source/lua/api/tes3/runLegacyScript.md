# runLegacyScript

This function will compile and run a mwscript chunk of code. This is not ideal to use, but can be used for features not yet exposed to lua.

## Parameters

This function accepts parameters through a table with the following named entries:

<dl class="describe">
<dt><code class="descname">script: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3script.html">tes3script</a></code></dt>
<dd>

The base script to base the execution from.

</dd>
<dt><code class="descname">source: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The compilation source to use. Defaults to tes3.scriptSource.default

</dd>
<dt><code class="descname">command: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The script text to compile and run.

</dd>
<dt><code class="descname">variables: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3scriptVariables.html">tes3scriptVariables</a></code></dt>
<dd>

If a reference is provided, the reference's variables will be used.

</dd>
<dt><code class="descname">reference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference|tes3mobileActor|string.html">tes3reference|tes3mobileActor|string</a></code></dt>
<dd>

The reference to target for execution.

</dd>
<dt><code class="descname">dialogue: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue|string.html">tes3dialogue|string</a></code></dt>
<dd>

If compiling for dialogue context, the dialogue associated with the script.

</dd>
<dt><code class="descname">info: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogueInfo.html">tes3dialogueInfo</a></code></dt>
<dd>

The info associated with the dialogue.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">executed: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

No description available.

</dd>
</dl>
