# niAVObject

The typical base type for most NetImmerse scene graph objects.

## Values

```eval_rst
.. toctree::
    :hidden:

    niAVObject/flags
    niAVObject/name
    niAVObject/references
    niAVObject/rotation
    niAVObject/runTimeTypeInformation
```

#### [flags](niAVObject/flags.md)

> Flags, dependent on the specific object type.

#### [name](niAVObject/name.md)

> The human-facing name of the given object.

#### [references](niAVObject/references.md)

> The number of references that exist for the given object. When this value hits zero, the object's memory is freed.

#### [rotation](niAVObject/rotation.md)

> The object's local rotation matrix.

#### [runTimeTypeInformation](niAVObject/runTimeTypeInformation.md)

> The runtime type information for this object.

## Functions

```eval_rst
.. toctree::
    :hidden:

    niAVObject/clone
    niAVObject/isInstanceOfType
    niAVObject/isOfType
    niAVObject/prependController
    niAVObject/removeAllControllers
    niAVObject/removeController
```

#### [clone](niAVObject/clone.md)

> Creates a copy of this object.

#### [isInstanceOfType](niAVObject/isInstanceOfType.md)

> Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.

#### [isOfType](niAVObject/isOfType.md)

> Determines if the object is of a given type. Types can be found in the tes3.niType table.

#### [prependController](niAVObject/prependController.md)

> Add a controller to the object as the first controller.

#### [removeAllControllers](niAVObject/removeAllControllers.md)

> Removes all controllers.

#### [removeController](niAVObject/removeController.md)

> Removes a controller from the object.
