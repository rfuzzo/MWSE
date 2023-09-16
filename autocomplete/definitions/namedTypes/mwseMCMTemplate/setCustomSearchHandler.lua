return {
	type = "method",
	description = [[This method assigns a custom search handler for the Template. This function should return true if this mod should show up in search results for given `searchText`.]],
	arguments = {
		{ name = "callback", type = "nil|fun(searchText: string): boolean" }
	}
}
