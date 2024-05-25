return {
	type = "method",
	description = [[Returns true if given `mwseKeyMouseCombo` should be treated as unbound by this Binder. This method needs to be implemented in children of Binder.]],
	arguments = {
		{ name = "keyCombo", type = "mwseKeyMouseCombo" }
	},
	returns = {{ name = "isUnbound", type = "boolean" }}
}
