
# Introduction

Welcome to the MWSE-Lua interface. Starting in MWSE 2.1, modders are able to create powerful, event-driven modifications to *The Elder Scrolls III: Morrowind* using the [Lua](https://www.lua.org/) scripting language.

Unlike traditional mwscript, Lua scripting is responsive. Instead of checking every frame to see if an object is being activated, a mod might register to see if their reference was activated. This introduction covers the surface of the different components important to scripting with MWSE-Lua.

Lua files do not reside in esms/esps, but rather live in the `Data Files\MWSE` directory.


## Lua Scripting Language

This guide is not meant to be a comprehensive introduction to the Lua language. Its syntax is simple. The following code block demonstrates what the language looks like:

```lua
-- Define a simple function that takes a single parameter.
local function myFunctionName(firstFunctionParameter)
    -- Print to the MWSE log, with the value that was passed.
    mwse.log("Called my function with parameter = %s", firstFunctionParameter)
end

-- Print "foo" to the MWSE log, prefixed with the function above.
myFunctionName("foo")
```

For a broader introduction to the Lua scripting language, refer to the [Introduction to Lua](./introduction-to-lua.md) guide.

## Morrowind Object Types

MWSE provides many bindings to more directly manipulate the object types that the Morrowind engine uses. In this example, we find the skooma object, and rename it *No-No Juice*.

```lua
-- Tell MWSE that we want to find the skooma object.
local skooma = tes3.getObject("potion_skooma_01")

-- Set the skooma object's name.
skooma.name = "No-No Juice"
```

A complete list of exposed TES3 types and their associated properties/functions can be seen on the respective `tes3 types` page.


## Events

Events are the primary way in which script modules interact with the game. There are many event hooks, covering everything from player level up to object collisions to world activations. Using an event typically looks like this:

```lua
-- Define our callback, which will get called when the event happens.
local function myKeyEvent(eventData)
    if (eventData.pressed) then
        mwse.log("Key #%d was pressed.", eventData.keyCode)
    else
        mwse.log("Key #%d was released.", eventData.keyCode)
    end
end

-- Tell MWSE that we want our callback to be invoked when a key is pressed.
event.register(tes3.event.key, myKeyEvent)
```

We can also pass filters to events. For the key event, the filter is the key that was pressed/released.

```lua
-- If we use this instead of the above registration, we filter to key 22 (U).
event.register(tes3.event.key, myKeyEvent, { filter = tes3.scanCode.u })
```

For a broader introduction to event based programming, refer to the [Introduction to Event Based Programming](./introduction-to-event-based-programming.md) guide.

The details of which events are available and what event data is exposed to them can be found on the events page.


## Support Libraries

On top of all this are support libraries to help make modding easier. An example library is [timer](../apis/timer.md), which helps to manage time-based operations.

```lua
-- Define the function we want to call when our timer completes.
local function myTimerCallback()
    tes3.messageBox({ message = "My timer completed!" })
end

-- Start a timer that finishes after 5 seconds.
-- When it does finish it will call the above function.
timer.start(5, myTimerCallback)
```


## An Unsandboxed World

MWSE does not do any sandboxing for mods. This enables clever innovations, like [Sky Diversity](https://www.nexusmods.com/morrowind/mods/44345), without the need for externally running programs. This also means that MWSE mods can bring in any lua modules they wish to package. Additionally, they can bring in native code -- allowing powerful extensions that Oblivion and Skyrim have had for years.


## Mod Initialization Scripts

So how do you access all this, and start getting your fingers into the event systems? Unlike vanilla mwscript, Lua scripts are not explicitly restricted to an actively running game. They are also not restricted to esp files -- many MWSE-Lua mods do not require an esp (though may choose to see if an esp is active for an easier user experience).

By placing a file with the name `main.lua` inside the lua folder or any of its subdirectories, that file will get executed when the game is being initialized (e.g. before any esm/esp files are accessed).

For example, with the file `Data Files\MWSE\mods\demo\main.lua` in place, it will get executed. With the following contents, it will ensure that when a save game is loaded, we get the save game filename printed to our log.

```lua
local function myLoadedGameCallback(e)
    mwse.log("Loaded game: %s", e.filename)
end
event.register(tes3.event.loaded, myLoadedGameCallback)
```


## Script Overrides and OpenMW Semi-Compatibility

Another feature of MWSE-Lua is the ability to override the normal execution of mwscript. This means that if we have a script in an esp file called `myScript` we can do the following code to override its behavior:

```lua
local function myOverrideFunction(params)
    tes3.messageBox(string.format("I'm running script '%s' on reference '%s' from Lua, not mwscript!", params.script.id, params.reference.id))
end

-- Use the above function instead of mwscript logic.
mwse.overrideScript("myScript", myOverrideFunction)
```


OpenMW will not be adding compatibility with MWSE mods, legacy or Lua-based. But script overrides exposes a way for modders to write mods that have extended MWSE functionality without causing issues in OpenMW. Basic functionality can be kept to mwscript, while the script can be overriden to enable advanced functionality using Lua.


## Getting Started

Not sure where to start? Take a look at setting up a [Development Workflow](./development-workflows.md), Then, try the [Creating a Mod](./creating-a-mod.md) guide, which covers the creation of a new mod from start to finish using MWSE-Lua.
