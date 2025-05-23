# mwseLoggerRecord
<div class="search_terms" style="display: none">mwseloggerrecord</div>

<!---
	This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
	More information: https://github.com/MWSE/MWSE/tree/master/docs
-->

Holds information about the context in which a logging message was created. This is currently only used when formatting log messages. This structure makes it easier to specify custom formatters.

## Properties

### `level`
<div class="search_terms" style="display: none">level</div>

The logging level of this message. (e.g, if `Logger:info` was called, then this will be `mwseLogger.logLevel.info`.)

**Returns**:

* `result` (mwseLogger.logLevel)

***

### `lineNumber`
<div class="search_terms" style="display: none">linenumber</div>

The linenumber that triggered this record to be created.
Will be `false` if the "Enable Log Line Numbers" MWSE setting is disabled.


**Returns**:

* `result` (integer, false)

***

### `stackLevel`
<div class="search_terms" style="display: none">stacklevel</div>

The stack level offset at the time of record creation. This information can be used when calling `debug.getinfo` in custom formatters.

**Returns**:

* `result` (integer)

***

### `timestamp`
<div class="search_terms" style="display: none">timestamp</div>

The timestamp associated to this record. This is obtained directly from `socket.gettime()`. In particular, it captures the current real-world time, rather than the amount of time since the game launched.

Will be `false` when `Logger.includeTimestamp` is `false`.

**Returns**:

* `result` (number, false)

