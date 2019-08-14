# tes3light

A core light object. This isn't actually a light in the rendering engine, but something like a lamp or torch.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3light/__tostring
    tes3light/boundingBox
    tes3light/canCarry
    tes3light/color
    tes3light/deleted
    tes3light/disabled
    tes3light/flickers
    tes3light/flickersSlowly
    tes3light/icon
    tes3light/id
    tes3light/isDynamic
    tes3light/isFire
    tes3light/isNegative
    tes3light/isOffByDefault
    tes3light/mesh
    tes3light/modified
    tes3light/name
    tes3light/nextInCollection
    tes3light/objectFlags
    tes3light/objectType
    tes3light/owningCollection
    tes3light/previousInCollection
    tes3light/pulses
    tes3light/pulsesSlowly
    tes3light/radius
    tes3light/scale
    tes3light/sceneNode
    tes3light/sceneReference
    tes3light/script
    tes3light/sound
    tes3light/sourceMod
    tes3light/stolenList
    tes3light/time
    tes3light/value
    tes3light/weight
```

#### [__tostring](tes3light/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [boundingBox](tes3light/boundingBox.md)

> The bounding box for the object.

#### [canCarry](tes3light/canCarry.md)

> Access to the light's flags, determining if the light can be carried.

#### [color](tes3light/color.md)

> Access to the light's base colors, in an array-style table of four values. The values can range from 0 to 255.

#### [deleted](tes3light/deleted.md)

> The deleted state of the object.

#### [disabled](tes3light/disabled.md)

> The disabled state of the object.

#### [flickers](tes3light/flickers.md)

> Access to the light's flags, determining if the light attenuation flickers.

#### [flickersSlowly](tes3light/flickersSlowly.md)

> Access to the light's flags, determining if the light attenuation flickers slowly.

#### [icon](tes3light/icon.md)

> The path to the object's icon.

#### [id](tes3light/id.md)

> The unique identifier for the object.

#### [isDynamic](tes3light/isDynamic.md)

> Access to the light's flags, determining if the light affects dynamically moving objects.

#### [isFire](tes3light/isFire.md)

> Access to the light's flags, determining if the light represents flame.

#### [isNegative](tes3light/isNegative.md)

> Access to the light's flags, determining if the object creates darkness.

#### [isOffByDefault](tes3light/isOffByDefault.md)

> Access to the light's flags, determining if the light won't be active initially.

#### [mesh](tes3light/mesh.md)

> The path to the object's mesh.

#### [modified](tes3light/modified.md)

> The modification state of the object since the last save.

#### [name](tes3light/name.md)

> The player-facing name for the object.

#### [nextInCollection](tes3light/nextInCollection.md)

> The next object in parent collection's list.

#### [objectFlags](tes3light/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3light/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [owningCollection](tes3light/owningCollection.md)

> The collection responsible for holding this object.

#### [previousInCollection](tes3light/previousInCollection.md)

> The previous object in parent collection's list.

#### [pulses](tes3light/pulses.md)

> Access to the light's flags, determining if the light attenuation pulses.

#### [pulsesSlowly](tes3light/pulsesSlowly.md)

> Access to the light's flags, determining if the light attenuation pulses slowly.

#### [radius](tes3light/radius.md)

> The base radius of the light.

#### [scale](tes3light/scale.md)

> The object's scale.

#### [sceneNode](tes3light/sceneNode.md)

> The scene graph node for this object.

#### [sceneReference](tes3light/sceneReference.md)

> The scene graph reference node for this object.

#### [script](tes3light/script.md)

> The script that runs on the object.

#### [sound](tes3light/sound.md)

> The sound that runs on the object.

#### [sourceMod](tes3light/sourceMod.md)

> The filename of the mod that owns this object.

#### [stolenList](tes3light/stolenList.md)

> A list of actors that the object has been stolen from.

#### [time](tes3light/time.md)

> The amount of time that the light will last.

#### [value](tes3light/value.md)

> The value of the object.

#### [weight](tes3light/weight.md)

> The weight, in pounds, of the object.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3light/getTimeLeft
```

#### [getTimeLeft](tes3light/getTimeLeft.md)

> Gets the time remaining for a light, given a tes3itemData, tes3reference, or tes3equipmentStack.
