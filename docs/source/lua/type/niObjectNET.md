# niObjectNET

An object that has a name, extra data, and controllers.

## Values

```eval_rst
.. toctree::
    :hidden:

    niObjectNET/name
    niObjectNET/references
    niObjectNET/runTimeTypeInformation
```

#### [name](niObjectNET/name.md)

> The human-facing name of the given object.

#### [references](niObjectNET/references.md)

> The number of references that exist for the given object. When this value hits zero, the object's memory is freed.

#### [runTimeTypeInformation](niObjectNET/runTimeTypeInformation.md)

> The runtime type information for this object.

## Functions

```eval_rst
.. toctree::
    :hidden:

    niObjectNET/clone
    niObjectNET/isInstanceOfType
    niObjectNET/isOfType
    niObjectNET/prependController
    niObjectNET/removeAllControllers
    niObjectNET/removeController
```

#### [clone](niObjectNET/clone.md)

> Creates a copy of this object.

#### [isInstanceOfType](niObjectNET/isInstanceOfType.md)

> Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.

#### [isOfType](niObjectNET/isOfType.md)

> Determines if the object is of a given type. Types can be found in the tes3.niType table.

#### [prependController](niObjectNET/prependController.md)

> Add a controller to the object as the first controller.

#### [removeAllControllers](niObjectNET/removeAllControllers.md)

> Removes all controllers.

#### [removeController](niObjectNET/removeController.md)

> Removes a controller from the object.
