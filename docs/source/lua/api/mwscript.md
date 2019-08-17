# mwscript

The mwscript library allows vanilla mwscript functions to be called. This is not always ideal, and this library is deprecated. Avoid using it if at all possible.

## Functions

```eval_rst
.. toctree::
    :hidden:

    mwscript/activate
    mwscript/addItem
    mwscript/addSoulGem
    mwscript/addSpell
    mwscript/addToLevCreature
    mwscript/addToLevItem
    mwscript/addTopic
    mwscript/aiTravel
    mwscript/disable
    mwscript/drop
    mwscript/enable
    mwscript/equip
    mwscript/explodeSpell
    mwscript/getButtonPressed
    mwscript/getDetected
    mwscript/getDisabled
    mwscript/getDistance
    mwscript/getItemCount
    mwscript/getPCJumping
    mwscript/getPCRunning
    mwscript/getPCSneaking
    mwscript/getReference
    mwscript/getScript
    mwscript/getSpellEffects
    mwscript/hasItemEquipped
    mwscript/placeAtPC
    mwscript/playSound
    mwscript/position
    mwscript/positionCell
    mwscript/removeItem
    mwscript/removeSpell
    mwscript/scriptRunning
    mwscript/setLevel
    mwscript/startCombat
    mwscript/startScript
    mwscript/stopCombat
    mwscript/stopScript
    mwscript/stopSound
    mwscript/wakeUpPC
```

<dl class="describe">
<dt><code class="descname"><a href="mwscript/activate.html">activate</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string})</code></dt>
<dd>

Wrapper for the Activate mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/addItem.html">addItem</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>count:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AddItem mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/addSoulGem.html">addSoulGem</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>creature:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3creature.html">tes3creature</a>|string, <i>soulgem:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3misc.html">tes3misc</a>|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AddSoulGem mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/addSpell.html">addSpell</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>spell:</i> tes3spell|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AddItem mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/addToLevCreature.html">addToLevCreature</a>({<i>list:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3leveledCreature.html">tes3leveledCreature</a>|string, <i>creature:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3actor.html">tes3actor</a>|string, <i>level:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AddToLevCreature mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/addToLevItem.html">addToLevItem</a>({<i>list:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3leveledItem.html">tes3leveledItem</a>|string, <i>item:</i> tes3item|string, <i>level:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AddToLevItem mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/addTopic.html">addTopic</a>({<i>topic:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3dialogue.html">tes3dialogue</a>|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AddItem mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/aiTravel.html">aiTravel</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>x:</i> number, <i>y:</i> number, <i>z:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the AITravel mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/disable.html">disable</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>modify:</i> boolean}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the Disable mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/drop.html">drop</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>count:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the Drop mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/enable.html">enable</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>modify:</i> boolean}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the Enable mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/equip.html">equip</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the Equip mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/explodeSpell.html">explodeSpell</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>spell:</i> tes3spell|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the ExplodeSpell mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getButtonPressed.html">getButtonPressed</a>()</code></dt>
<dd>

Wrapper for the GetButtonPressed mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getDetected.html">getDetected</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> boolean</code></dt>
<dd>

Wrapper for the GetDetected mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getDisabled.html">getDisabled</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> boolean</code></dt>
<dd>

Wrapper for the GetDisabled mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getDistance.html">getDistance</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> boolean</code></dt>
<dd>

Wrapper for the GetDistance mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getItemCount.html">getItemCount</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string}) -> number</code></dt>
<dd>

Wrapper for the GetItemCount mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getPCJumping.html">getPCJumping</a>()</code></dt>
<dd>

Wrapper for the GetPCJumping mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getPCRunning.html">getPCRunning</a>()</code></dt>
<dd>

Wrapper for the GetPCRunning mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getPCSneaking.html">getPCSneaking</a>()</code></dt>
<dd>

Wrapper for the GetPCSneaking mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/getReference.html">getReference</a>()</code></dt>
<dd>

Returns the script target for the currently running Morrowind script, if any.

</dd>
<dt><code class="descname"><a href="mwscript/getScript.html">getScript</a>()</code></dt>
<dd>

Returns the currently running Morrowind script, if any.

</dd>
<dt><code class="descname"><a href="mwscript/getSpellEffects.html">getSpellEffects</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>spell:</i> tes3spell|string}) -> boolean</code></dt>
<dd>

Wrapper for the GetSpellEffects mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/hasItemEquipped.html">hasItemEquipped</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string}) -> boolean</code></dt>
<dd>

Wrapper for the HasItemEquipped mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/placeAtPC.html">placeAtPC</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>object:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a>|string, <i>count:</i> number, <i>distance:</i> number, <i>direction:</i> number}) -> <i>lastPlacedReference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Wrapper for the PlaceAtPC mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/playSound.html">playSound</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>sound:</i> tes3sound|string}) -> boolean</code></dt>
<dd>

Wrapper for the PlaySound mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/position.html">position</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>cell:</i> string, <i>x:</i> number, <i>y:</i> number, <i>z:</i> number, <i>rotation:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the Position mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/positionCell.html">positionCell</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>cell:</i> string, <i>x:</i> number, <i>y:</i> number, <i>z:</i> number, <i>rotation:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the PositionCell mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/removeItem.html">removeItem</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>item:</i> tes3item|string, <i>count:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the RemoveItem mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/removeSpell.html">removeSpell</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>spell:</i> tes3spell|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the RemoveSpell mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/scriptRunning.html">scriptRunning</a>({<i>script:</i> tes3script|string}) -> boolean</code></dt>
<dd>

Wrapper for the ScriptRunning mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/setLevel.html">setLevel</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>level:</i> number}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the SetLevel mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/startCombat.html">startCombat</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the StartCombat mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/startScript.html">startScript</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>script:</i> tes3script|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the StartCombat mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/stopCombat.html">stopCombat</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>target:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the StopCombat mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/stopScript.html">stopScript</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>script:</i> tes3script|string}) -> <i>executed:</i> boolean</code></dt>
<dd>

Wrapper for the StartCombat mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/stopSound.html">stopSound</a>({<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>|<a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileActor.html">tes3mobileActor</a>|string, <i>sound:</i> tes3sound|string}) -> boolean</code></dt>
<dd>

Wrapper for the StopSound mwscript function.

</dd>
<dt><code class="descname"><a href="mwscript/wakeUpPC.html">wakeUpPC</a>()</code></dt>
<dd>

Wrapper for the WakeUpPC mwscript function.

</dd>
</dl>
