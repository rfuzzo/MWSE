# tes3inventory

An inventory composes of an iterator, and flags caching the state of the inventory.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3inventory/__length
    tes3inventory/__pairs
    tes3inventory/flags
    tes3inventory/iterator
```

#### [__length](tes3inventory/__length.md)

> Gives the number of elements in the contained iterator.

#### [__pairs](tes3inventory/__pairs.md)

> A quick access to the elements in the contained iterator.

#### [flags](tes3inventory/flags.md)

> Raw bit-based flags.

#### [iterator](tes3inventory/iterator.md)

> Direct acces to the container that holds the inventory's items.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3inventory/addItem
    tes3inventory/calculateWeight
    tes3inventory/contains
    tes3inventory/dropItem
    tes3inventory/removeItem
    tes3inventory/resolveLeveledItems
```

#### [addItem](tes3inventory/addItem.md)

> Adds an item into the inventory directly. This should not be used, in favor of the tes3 API function.

#### [calculateWeight](tes3inventory/calculateWeight.md)

> Calculates the weight of all items in the container.

#### [contains](tes3inventory/contains.md)

> Checks to see if the inventory contains an item.

#### [dropItem](tes3inventory/dropItem.md)

> Checks to see if the inventory contains an item. This should not be used, in favor of tes3 APIs.

#### [removeItem](tes3inventory/removeItem.md)

> Removes an item from the inventory directly. This should not be used, in favor of the tes3 API function.

#### [resolveLeveledItems](tes3inventory/resolveLeveledItems.md)

> Resolves all contained leveled lists and adds the randomized items to the inventory. This should generally not be called directly.
