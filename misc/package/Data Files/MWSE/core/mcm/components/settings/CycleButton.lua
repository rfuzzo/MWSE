--[[
	CycleButton: Toggles a variable between given options.
	It has the same use as Dropdown, but it looks different.

]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

-- Parent class
local Parent = require("mcm.components.settings.Setting")

--- Class object
--- @class mwseMCMCycleButton
local CycleButton = Parent:new()

--- @param parentBlock tes3uiElement
function CycleButton:makeComponent(parentBlock)
	local button = parentBlock:createCycleButton({
		id = tes3ui.registerID("CycleButton"),
		options = self.options
	})
	button.borderAllSides = 0
	button.borderRight = self.indent
	button.autoWidth = true
	self.elements.button = button
	table.insert(self.mouseOvers, button)

	local widget = button.widget --[[@as tes3uiCycleButton]]
	if self:checkDisabled() then
		local textElement = widget:getTextElement()
		textElement.text = "---"
	else
		widget.value = self.variable.value
	end

	button:registerAfter("valueChanged", function(e)
		self.variable.value = e.source.widget.value
		self:update()
	end)

	-- Prevent clicking if disabled
	button:registerBefore(tes3.uiEvent.mouseClick, function(e)
		if self:checkDisabled() then
			return true
		end
		e.source:forwardEvent(e)
	end)
end

--- @param parentBlock tes3uiElement
function CycleButton:createOuterContainer(parentBlock)
	Parent.createOuterContainer(self, parentBlock)
	-- A bit weird but it seems to line buttons up better with other settings
	self.elements.outerContainer.borderTop = self.paddingBottom
	self.elements.outerContainer.borderBottom = 0
	self.elements.outerContainer.flowDirection = tes3.flowDirection.leftToRight
end

--- @param parentBlock tes3uiElement
function CycleButton:createInnerContainer(parentBlock)
	Parent.createInnerContainer(self, parentBlock)
	self.elements.innerContainer.paddingLeft = 0
end

--- @param parentBlock tes3uiElement
function CycleButton:createContentsContainer(parentBlock)
	self:createInnerContainer(parentBlock)
	if self.leftSide then
		self:makeComponent(self.elements.innerContainer)
	end
	self:createLabel(self.elements.innerContainer)
	if not self.leftSide then
		self:makeComponent(self.elements.innerContainer)
	end
end

return CycleButton
