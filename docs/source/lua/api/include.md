# include

Loads the given module. The function starts by looking into the package.loaded table to determine whether modname is already loaded. If it is, then require returns the value stored at package.loaded[modname]. Otherwise, it tries to find a loader for the module. If no module could be found, it returns nil instead of erroring.

## Parameters

<dl class="describe">
<dt><code class="descname">modname: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

No description available.

</dd>
</dl>

## Returns

<dl class="describe">
<dt><code class="descname">undefined: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table .html">table </a></code></dt>
<dd>

No description available.

</dd>
</dl>
