return {
	type = "value",
	description = [[A custom filter function. The callback function needs to return a string array of items that should appear in the list. To use callback, don't pass the `type` field, just `label` and `callback`.]],
	valuetype = "nil|fun(): string[]",
}
