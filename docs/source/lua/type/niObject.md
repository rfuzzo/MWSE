# niObject

The base-most object from which almost all NetImmerse structures are derived from.

## Values

```eval_rst
.. toctree::
    :hidden:

    niObject/references
    niObject/runTimeTypeInformation
```

#### [references](niObject/references.md)

> The number of references that exist for the given object. When this value hits zero, the object's memory is freed.

#### [runTimeTypeInformation](niObject/runTimeTypeInformation.md)

> The runtime type information for this object.

## Functions

```eval_rst
.. toctree::
    :hidden:

    niObject/clone
    niObject/isInstanceOfType
    niObject/isOfType
```

#### [clone](niObject/clone.md)

> Creates a copy of this object.

#### [isInstanceOfType](niObject/isInstanceOfType.md)

> Determines if the object is of a given type, or of a type derived from the given type. Types can be found in the tes3.niType table.

#### [isOfType](niObject/isOfType.md)

> Determines if the object is of a given type. Types can be found in the tes3.niType table.
