return {
	type = "method",
	description = [[Creates one a search bar on the given list. It consists of thin border UI element stored in `self.elements.searchBar[listName]` and text input UI element stored in `self.elements.searchBarInput[listName]`.]],
	arguments = {
		{ name = "parentBlock", type = "tes3uiElement" },
		{ name = "listName", type = "string", description = "One of the following: `\"leftList\"` or `\"rightList\"`." },
	}
}
