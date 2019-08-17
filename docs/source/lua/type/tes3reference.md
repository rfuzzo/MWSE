# tes3reference

A reference is a sort of container structure for objects. It holds a base object, as well as various variables associated with that object that make it unique.

For example, many doors may share the same base object. However, each door reference might have a different owner, different lock/trap statuses, etc. that make the object unique.

## Properties

<dl class="describe">
<dt><code class="descname">activationReference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

The current reference, if any, that this reference will activate.

</dd>
<dt><code class="descname">attachments: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A table with friendly named access to all supported attachments.

</dd>
<dt><code class="descname">cell: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3cell.html">tes3cell</a></code></dt>
<dd>

The cell that the reference is currently in.

</dd>
<dt><code class="descname">context: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3scriptContext.html">tes3scriptContext</a></code></dt>
<dd>

Access to the script context for this reference and its associated script.

</dd>
<dt><code class="descname">data: <a href="https://mwse.readthedocs.io/en/latest/lua/type/table.html">table</a></code></dt>
<dd>

A generic lua table that data can be written to, and synced to/from the save. All information stored must be valid for serialization to json. For item references, this is the same table as on the tes3itemData structure.

</dd>
<dt><code class="descname">deleted: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The deleted state of the object.

</dd>
<dt><code class="descname">disabled: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The disabled state of the object.

</dd>
<dt><code class="descname">id: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The unique identifier for the object.

</dd>
<dt><code class="descname">isEmpty: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

Friendly access onto the reference's empty inventory flag.

</dd>
<dt><code class="descname">isRespawn: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

If true, the references respawn flag is set.

</dd>
<dt><code class="descname">light: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niPointLight.html">niPointLight</a></code></dt>
<dd>

Direct access to the scene graph light, if a dynamic light is set.

</dd>
<dt><code class="descname">lockNode: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3lockNode.html">tes3lockNode</a></code></dt>
<dd>

Quick access to the reference's lock node, if any.

</dd>
<dt><code class="descname">mobile: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3mobileObject.html">tes3mobileObject</a></code></dt>
<dd>

Access to the attached mobile object, if applicable.

</dd>
<dt><code class="descname">modified: <a href="https://mwse.readthedocs.io/en/latest/lua/type/boolean.html">boolean</a></code></dt>
<dd>

The modification state of the object since the last save.

</dd>
<dt><code class="descname">nextInCollection: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

The next object in parent collection's list.

</dd>
<dt><code class="descname">nextNode: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

The next reference in the parent reference list.

</dd>
<dt><code class="descname">nodeData: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

Redundant access to this object, for iterating over a tes3referenceList.

</dd>
<dt><code class="descname">object: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3physicalObject.html">tes3physicalObject</a></code></dt>
<dd>

The object that the reference is for, such as a weapon, armor, or actor.

</dd>
<dt><code class="descname">objectFlags: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The raw flags of the object.

</dd>
<dt><code class="descname">objectType: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The type of object. Maps to values in tes3.objectType.

</dd>
<dt><code class="descname">orientation: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

Access to the reference's orientation.

</dd>
<dt><code class="descname">owningCollection: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3referenceList.html">tes3referenceList</a></code></dt>
<dd>

The collection responsible for holding this object.

</dd>
<dt><code class="descname">position: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3vector3.html">tes3vector3</a></code></dt>
<dd>

Access to the reference's position.

</dd>
<dt><code class="descname">previousInCollection: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3object.html">tes3object</a></code></dt>
<dd>

The previous object in parent collection's list.

</dd>
<dt><code class="descname">previousNode: <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a></code></dt>
<dd>

The previous reference in the parent reference list.

</dd>
<dt><code class="descname">scale: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

The object's scale.

</dd>
<dt><code class="descname">sceneNode: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

The scene graph node that the reference uses for rendering.

</dd>
<dt><code class="descname">sceneReference: <a href="https://mwse.readthedocs.io/en/latest/lua/type/niNode.html">niNode</a></code></dt>
<dd>

The scene graph reference node for this object.

</dd>
<dt><code class="descname">sourceMod: <a href="https://mwse.readthedocs.io/en/latest/lua/type/string.html">string</a></code></dt>
<dd>

The filename of the mod that owns this object.

</dd>
<dt><code class="descname">stackSize: <a href="https://mwse.readthedocs.io/en/latest/lua/type/number.html">number</a></code></dt>
<dd>

Access to the size of a stack, if the reference represents one or more items.

</dd>
</dl>

## Methods

<dl class="describe">
<dt><code class="descname">activate(<i>reference:</i> <a href="https://mwse.readthedocs.io/en/latest/lua/type/tes3reference.html">tes3reference</a>)</code></dt>
<dd>

Causes this reference to activate another. This will lead them to go through doors, pick up items, etc.

</dd>
<dt><code class="descname">clearActionFlag(<i>flagIndex:</i> number)</code></dt>
<dd>

Unsets a bit in the reference's action data attachment

</dd>
<dt><code class="descname">clone()</code></dt>
<dd>

Clones a reference for a base actor into a reference to an instance of that actor. For example, this will force a container to resolve its leveled items and have its own unique inventory.

</dd>
<dt><code class="descname">deleteDynamicLightAttachment()</code></dt>
<dd>

Deletes the dynamic light attachment, if it exists. This will automatically detach the dynamic light from affected nodes.

</dd>
<dt><code class="descname">detachDynamicLightFromAffectedNodes()</code></dt>
<dd>

Removes the dynamic light from any affected scene graph nodes, but will not delete the associated attachment.

</dd>
<dt><code class="descname">getAttachedDynamicLight()</code></dt>
<dd>

Fetches the dynamic light attachment.

</dd>
<dt><code class="descname">getOrCreateAttachedDynamicLight(<i>light:</i> niPointLight, <i>value:</i> number) -> tes3lightNode</code></dt>
<dd>

Fetches the dynamic light attachment. If there isn't one, a new one will be created with the given light and value.

</dd>
<dt><code class="descname">setActionFlag(<i>flagIndex:</i> number)</code></dt>
<dd>

Sets a bit in the reference's action data attachment

</dd>
<dt><code class="descname">testActionFlag(<i>flagIndex:</i> number) -> boolean</code></dt>
<dd>

Returns the flag's value in the reference's action data attachment

</dd>
<dt><code class="descname">updateEquipment()</code></dt>
<dd>

Causes the reference, if of an actor, to reevaluate its equipment choices and equip items it should.

</dd>
<dt><code class="descname">updateSceneGraph()</code></dt>
<dd>

Updates the reference's local rotation matrix, propagates position changes to the scene graph, and sets the reference's modified flag.

</dd>
</dl>

## Metatable Events

<dl class="describe">
<dt><code class="descname">__tostring</code></dt>
<dd>

An object can be converted using `tostring()` to its id.

</dd>
</dl>
