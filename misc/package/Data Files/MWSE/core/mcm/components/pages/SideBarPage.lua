--[[
	Top level category with a side bar that shows text for any component
	hovered over.
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.pages.Page")

--- @class mwseMCMSideBarPage
--- @field sidebarComponents mwseMCMComponent[] *Deprecated*
local SideBarPage = Parent:new()
SideBarPage.triggerOn = "MCM:MouseOver"
SideBarPage.triggerOff = "MCM:MouseLeave"

--- @param data mwseMCMSideBarPage.new.data|nil
--- @return mwseMCMSideBarPage page
function SideBarPage:new(data)
	local t = Parent:new(data) --[[@as mwseMCMSideBarPage]]
	t.sidebar = self:getComponent({ class = "MouseOverPage" }) --[[@as mwseMCMMouseOverPage]]

	setmetatable(t, self)
	self.__index = self
	return t

end

--- @param parentBlock tes3uiElement
function SideBarPage:createSidetoSideBlock(parentBlock)
	local sideToSideBlock = parentBlock:createBlock()
	sideToSideBlock.flowDirection = "left_to_right"
	sideToSideBlock.heightProportional = 1.0
	sideToSideBlock.widthProportional = 1.0
	self.elements.sideToSideBlock = sideToSideBlock
end

--- @param parentBlock tes3uiElement
function SideBarPage:createLeftColumn(parentBlock)
	Parent.createOuterContainer(self, parentBlock)
end

--- Sidebar
--- @param parentBlock tes3uiElement
function SideBarPage:createRightColumn(parentBlock)

	self.sidebar:create(parentBlock)
	local defaultView = self.sidebar.elements.subcomponentsContainer
	local mouseoverView = self.sidebar.elements.mouseOverBlock

	-- For backwards compatibility, add sidebarComponents elements
	if self.sidebarComponents then
		self:createSubcomponents(defaultView, self.sidebarComponents)

		-- or description
	elseif self.description then
		-- By default, sidebar is a mouseOver description pane
		local sidebarInfo = self:getComponent({
			-- label = self.label,
			text = self.description,
			class = "Info",
		}) --[[@as mwseMCMInfo]]
		sidebarInfo:create(defaultView)
	end

	-- mouseover shows descriptions of settings
	local mouseOver = self:getComponent({
		-- label = self.label,
		text = self.description or "",
		class = "MouseOverInfo",
	}) --[[@as mwseMCMMouseOverInfo]]
	mouseOver:create(mouseoverView)
	mouseOver.elements.outerContainer.visible = false
	self.elements.mouseOver = mouseOver

	--- event to hide default and show mouseover
	--- @param component mwseMCMComponent
	local function doMouseOver(component)
		if component.description then
			mouseOver.elements.outerContainer.visible = true
			defaultView.visible = false
		end
	end

	-- event to hide mouseover and show default
	local function doMouseLeave()
		mouseOver.elements.outerContainer.visible = false
		defaultView.visible = true
	end

	-- register events
	event.register(self.triggerOn, doMouseOver)
	event.register(self.triggerOff, doMouseLeave)
	parentBlock:register("destroy", function()
		event.unregister(self.triggerOn, doMouseOver)
		event.unregister(self.triggerOff, doMouseLeave)
	end)

end

--- @param parentBlock tes3uiElement
function SideBarPage:createOuterContainer(parentBlock)
	self:createSidetoSideBlock(parentBlock)
	self:createLeftColumn(self.elements.sideToSideBlock)
	self:createRightColumn(self.elements.sideToSideBlock)
end

return SideBarPage
