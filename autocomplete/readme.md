# MWSE Definitions

This folder holds core definition files that describe the functionality of the MWSE Lua API. Each definition is a self-contained lua file that returns a table describing a particular element of the API.


## Syntax

Each definition should return a table describing how that element in the API functions. For example:

```lua
return {
    type = "function",
    description = [[Returns a value, limited by upper and lower bounds.]],
    arguments = {
        { name = "value", type = "number" },
        { name = "min", type = "number" },
        { name = "max", type = "number" },
    },
    returns = { { type = "number"} },
}
```

The nested nature of the files, and what their root folder is, determines how this definition is used. The following file tree would define the `math` library, as well as a few elements that hang off of it:

```
definitions/
    global/
        math/
            clamp.lua
            remap.lua
            round.lua
        math.lua
```

There are four folders that are parsed when building an output:

* `./definitions/global/`: The most basic of processing. Typically defines global APIs, such as `tes3.*` or `math.*`.
* `./definitions/type/`: While the elements found here do create something in the global scope, these define specific classes, such as `tes3vector3` or `tes3reference`.
* `./definitions/event/standard/`: These are definitions for callbacks for `event.register()`.
* `Data Files/MWSE/core/tes3/*.lua`: Excluding `init.lua`, all the tables stored here will be populated into the global API list.

### Common Fields

The following fields are common to all definition files:

```lua
return {
    -- Defines how this element is handled.
    type = ...,

    -- User-facing short description.
    -- Additional details may be provided depending on the generator used.
    description = [[Lorem ipsum...]], 
}
```

Valid types are:

* The common lua types (excluding `nil`): `boolean`, `number`, `function`, and `table`.
* The `class` type behaves much like a table, with extra handling for methods. These should always be found in the `./definitionts/type/` folder.
    * Functions can be labeled as `method`s to have an implicit `self` parameter. A non-method function hanging off of a class is treated as a static function. Methods should never be defined on non-class objects.
* Any type defined in the `type` folder.

### Functions and Methods

Functions can define what their arguments and return types are. There are generally two types of functions: `function` and `method`. Methods are only defined on types, while any table can hold a function.

```lua
return {
    type = "method",
    description = [[Calculates the total distance to another vector.]],

    -- Arguments are defined as an array-style table.
    -- Each value in the array is a table that defines the argument.
    arguments = {
        { name = "otherVector", type = "tes3vector3" }
    },

    -- Similarly, return values are defined as an array of return values.
    returns = {
        { name = "success", type = "boolean" },
        { name = "distance", type = "number" },
    },
}
```

Each argument can have several fields to help define it:

```lua
{
    -- The simple name for the variable.
    -- May not show up in all contexts.
    name = "otherVector",

    -- What type the parameter should be.
    -- Alternative types can be declared by using a pipe (|).
    -- ex: "tes3vector3|table"
    type = "tes3vector3",

    -- If true, the argument isn't required.
    -- Note that all following arguments should also be marked optional.
    optional = true,

    -- This defines the default value if one isn't provided.
    -- Like optional, all arguments that follow should also be optional.
    -- Note that arguments with defaults are implicitly optional.
    default = 4,
}
```

Additionally, it is common for an argument to be a table of specific values. This can be done by setting `type = "table"` and using the `values` field:

```lua
return {
	type = "function",
	description = [[Causes a misc item to be recognized as a soul gem, so that it can be used for soul trapping.]],
	arguments = {{
		name = "params",
		type = "table",
		values = {
			{ name = "item", type = "tes3misc|string", description = "The item to recognize as a soul gem." },
		},
	}},
	returns = { { name = "wasAdded", type = "boolean" }},
}
```


### Output-Specific Fields

None currently implemented.


## Building

`lua` is required to be in `PATH` to build this. Additionally, the `dkjson` and `lfs` modules must be in the global package scope.

To build all definitions, run `.\build.bat`.
