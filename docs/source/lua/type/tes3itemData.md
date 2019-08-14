# tes3itemData

A set of variables that differentiates one item from another.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3itemData/charge
    tes3itemData/condition
    tes3itemData/context
    tes3itemData/data
    tes3itemData/owner
    tes3itemData/requirement
    tes3itemData/script
    tes3itemData/scriptVariables
    tes3itemData/soul
    tes3itemData/timeLeft
```

#### [charge](tes3itemData/charge.md)

> The charge of the item. Provides incorrect values on misc items, which instead have a soul actor.

#### [condition](tes3itemData/condition.md)

> The condition/health of the item. Provides incorrect values on light items, which instead have a timeLeft property.

#### [context](tes3itemData/context.md)

> Returns an ease of use script context for variable access.

#### [data](tes3itemData/data.md)

> A generic lua table that data can be written to, and synced to/from the save. All information stored must be valid for serialization to json.

#### [owner](tes3itemData/owner.md)

> The script associated with the scriptVariables.

#### [requirement](tes3itemData/requirement.md)

> A requirement, typically associated with ownership and when the player may freely interact with an object. The type depends on the owner. Faction owners provide a required rank as a number, while NPCs provide a global variable to check.

#### [script](tes3itemData/script.md)

> The script associated with the scriptVariables.

#### [scriptVariables](tes3itemData/scriptVariables.md)

> Access to the structure where individual mwscript data is stored.

#### [soul](tes3itemData/soul.md)

> Only available on misc items. The actor that is stored inside the soul gem.

#### [timeLeft](tes3itemData/timeLeft.md)

> The time remaining on a light. Provides incorrect values on non-light items, which instead have a condition property.
