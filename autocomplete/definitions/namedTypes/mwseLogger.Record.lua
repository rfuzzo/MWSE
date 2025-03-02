--- A logging record. Contains information about the log level and the line number.
---@class Logger.Record
---@field stackLevel integer how far up the stack we're being called
---@field level Logger.LEVEL logging level
---@field lineNumber integer|false the line number, if enabled for this logger
---@field timestamp number|false the timestamp of this message
---@
return {
	type = "class",
	-- note: code lines are indented according which to which actual line they belong to.
	description = "Holds information about the context in which a logging message was created. \z
		This is currently only used when formatting log messages. This structure makes it easier to specify custom formatters.",
}
