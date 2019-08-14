# tes3class

A core object representing a character class.

## Values

```eval_rst
.. toctree::
    :hidden:

    tes3class/__tostring
    tes3class/attributes
    tes3class/bartersAlchemy
    tes3class/bartersApparatus
    tes3class/bartersArmor
    tes3class/bartersBooks
    tes3class/bartersClothing
    tes3class/bartersEnchantedItems
    tes3class/bartersIngredients
    tes3class/bartersLights
    tes3class/bartersLockpicks
    tes3class/bartersMiscItems
    tes3class/bartersProbes
    tes3class/bartersRepairTools
    tes3class/bartersWeapons
    tes3class/deleted
    tes3class/description
    tes3class/disabled
    tes3class/id
    tes3class/majorSkills
    tes3class/minorSkills
    tes3class/modified
    tes3class/name
    tes3class/objectFlags
    tes3class/objectType
    tes3class/offersEnchanting
    tes3class/offersRepairs
    tes3class/offersSpellmaking
    tes3class/offersSpells
    tes3class/offersTraining
    tes3class/playable
    tes3class/services
    tes3class/skills
    tes3class/sourceMod
    tes3class/specialization
```

#### [__tostring](tes3class/__tostring.md)

> An object can be converted using ``tostring()`` to its id.

#### [attributes](tes3class/attributes.md)

> An array-style table of the two attribute IDs associated with the class.

#### [bartersAlchemy](tes3class/bartersAlchemy.md)

> If true, the class will barter alchemy items.

#### [bartersApparatus](tes3class/bartersApparatus.md)

> If true, the class will barter apparatus items.

#### [bartersArmor](tes3class/bartersArmor.md)

> If true, the class will barter armor items.

#### [bartersBooks](tes3class/bartersBooks.md)

> If true, the class will barter book items.

#### [bartersClothing](tes3class/bartersClothing.md)

> If true, the class will barter clothing items.

#### [bartersEnchantedItems](tes3class/bartersEnchantedItems.md)

> If true, the class will barter enchanted items.

#### [bartersIngredients](tes3class/bartersIngredients.md)

> If true, the class will barter ingredient items.

#### [bartersLights](tes3class/bartersLights.md)

> If true, the class will barter light items.

#### [bartersLockpicks](tes3class/bartersLockpicks.md)

> If true, the class will barter lockpick items.

#### [bartersMiscItems](tes3class/bartersMiscItems.md)

> If true, the class will barter misc items.

#### [bartersProbes](tes3class/bartersProbes.md)

> If true, the class will barter probe items.

#### [bartersRepairTools](tes3class/bartersRepairTools.md)

> If true, the class will barter repair items.

#### [bartersWeapons](tes3class/bartersWeapons.md)

> If true, the class will barter weapon items.

#### [deleted](tes3class/deleted.md)

> The deleted state of the object.

#### [description](tes3class/description.md)

> Loads from disk and returns the description of the class.

#### [disabled](tes3class/disabled.md)

> The disabled state of the object.

#### [id](tes3class/id.md)

> The unique identifier for the object.

#### [majorSkills](tes3class/majorSkills.md)

> An array-style table of the 5 skills IDs associated with the class' major skills.

#### [minorSkills](tes3class/minorSkills.md)

> An array-style table of the 5 skills IDs associated with the class' major skills.

#### [modified](tes3class/modified.md)

> The modification state of the object since the last save.

#### [name](tes3class/name.md)

> The player-facing name for the object.

#### [objectFlags](tes3class/objectFlags.md)

> The raw flags of the object.

#### [objectType](tes3class/objectType.md)

> The type of object. Maps to values in tes3.objectType.

#### [offersEnchanting](tes3class/offersEnchanting.md)

> If true, the class will offer repair services.

#### [offersRepairs](tes3class/offersRepairs.md)

> If true, the class will offer enchanting services.

#### [offersSpellmaking](tes3class/offersSpellmaking.md)

> If true, the class will offer spellmaking services.

#### [offersSpells](tes3class/offersSpells.md)

> If true, the class will offer spell selling services.

#### [offersTraining](tes3class/offersTraining.md)

> If true, the class will offer spell training services.

#### [playable](tes3class/playable.md)

> If true, the class is selectable at character generation.

#### [services](tes3class/services.md)

> The services offered by the class. This is a bit field, and its values should typically be accessed through values such as bartersAlchemy.

#### [skills](tes3class/skills.md)

> An array-style table of the 10 skills IDs associated with the class. For major or minor skills specifically, use the majorSkills and MinorSkills properties.

#### [sourceMod](tes3class/sourceMod.md)

> The filename of the mod that owns this object.

#### [specialization](tes3class/specialization.md)

> The specialization for the class. Maps to the tes3.specialization table.
