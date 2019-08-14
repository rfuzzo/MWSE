# mwse

The mwse library provides methods for interacting with MWSE itself, rather than direct TES3 objects.

## Values

```eval_rst
.. toctree::
    :hidden:

    mwse/buildDate
    mwse/gameTimers
    mwse/realTimers
    mwse/simulateTimers
    mwse/stack
    mwse/string
    mwse/version
```

#### [buildDate](mwse/buildDate.md)

> A numerical representation of the date that version of MWSE currently being used was built on.
 >
 >Formatted as YYYYMMDD.

#### [gameTimers](mwse/gameTimers.md)

> The mwseTimerController responsible for game-type timers.

#### [realTimers](mwse/realTimers.md)

> The mwseTimerController responsible for real-type timers.

#### [simulateTimers](mwse/simulateTimers.md)

> The mwseTimerController responsible for simulate-type timers.

#### [stack](mwse/stack.md)

> The stack library provides functions to interact with the mwse mwscript stack, for dealing with custom mwscript extensions.

#### [string](mwse/string.md)

> The mwse string library provides functions for interacting with mwscript string storage.

#### [version](mwse/version.md)

> A numerical representation of the release version of MWSE currently being used.
 >
 >Formatted as AAABBBCCC, where A is the major version, BBB is the minor version, and CCC is the patch version. BBB and CCC are forward-padded.
 >
 >It is usually better to use mwse.buildDate instead.

## Functions

```eval_rst
.. toctree::
    :hidden:

    mwse/getVersion
    mwse/getVirtualMemoryUsage
    mwse/loadConfig
    mwse/log
    mwse/longToString
    mwse/overrideScript
    mwse/saveConfig
    mwse/stringToLong
```

#### [getVersion](mwse/getVersion.md)

> Equivalent to mwse.version.

#### [getVirtualMemoryUsage](mwse/getVirtualMemoryUsage.md)

> Returns the amount of memory used, in bytes.

#### [loadConfig](mwse/loadConfig.md)

> Loads a config table from Data Files\MWSE\config\{fileName}.json.

#### [log](mwse/log.md)

> This function writes information to the MWSELog.txt file in the user's installation directory.
 >
 >The message accepts formatting and additional parameters matching string.format's usage.

#### [longToString](mwse/longToString.md)

> Converts a TES3 object type (e.g. from tes3.objectType) into an uppercase, 4-character string.

#### [overrideScript](mwse/overrideScript.md)

> Configures MWSE to execute a given function instead when a script would run.

#### [saveConfig](mwse/saveConfig.md)

> Saves a config table to Data Files\MWSE\config\{fileName}.json.

#### [stringToLong](mwse/stringToLong.md)

> Converts an uppercase, 4-character string into a TES3 object type.
