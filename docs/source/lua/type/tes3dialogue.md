# tes3dialogue

A parent-level dialogue, such as a topic, voice, greeting, persuasion response, or journal.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3dialogue/__tostring
    tes3dialogue/deleted
    tes3dialogue/disabled
    tes3dialogue/id
    tes3dialogue/info
    tes3dialogue/journalIndex
    tes3dialogue/modified
    tes3dialogue/objectFlags
    tes3dialogue/objectType
    tes3dialogue/sourceMod
    tes3dialogue/type
```

#### [__tostring](tes3dialogue/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [deleted](tes3dialogue/deleted.md)

> The deleted state of the object.

#### [disabled](tes3dialogue/disabled.md)

> The disabled state of the object.

#### [id](tes3dialogue/id.md)

> The unique identifier for the object.

#### [info](tes3dialogue/info.md)

> A collection of individual entries in the dialogue.

#### [journalIndex](tes3dialogue/journalIndex.md)

> For journal dialogues, the currently active journal index.

#### [modified](tes3dialogue/modified.md)

> The modification state of the object since the last save.

#### [objectFlags](tes3dialogue/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3dialogue/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [sourceMod](tes3dialogue/sourceMod.md)

> The filename of the mod that owns this object.

#### [type](tes3dialogue/type.md)

> The type of the dialogue.

## Functions

```eval_rst
.. toctree::
    :hidden:

    tes3dialogue/addToJournal
    tes3dialogue/getInfo
```

#### [addToJournal](tes3dialogue/addToJournal.md)

> Adds the dialogue to the player's journal, if applicable, at a given index.

#### [getInfo](tes3dialogue/getInfo.md)

> Fetches the info that a given actor would produce for the dialogue.
