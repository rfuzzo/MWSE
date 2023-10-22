
--- This function will attach an equipment mesh directly to the
--- reference's scene graph. The skeleton (bone names) in the
--- equipment mesh should match the destination skeleton.
---@param mesh niNode
---@param reference tes3reference
local function attachMesh(mesh, reference)
	for shape in table.traverse(mesh.children) do
		if shape:isInstanceOfType(ni.type.NiTriShape) then
			---@cast shape niTriShape
			local skin = shape.skinInstance
			local referenceRoot = reference.sceneNode
			---@cast referenceRoot niNode

			if skin then
				skin.root = referenceRoot:getObjectByName(skin.root.name) --[[@as niNode]]
				for i, bone in ipairs(skin.bones) do
					skin.bones[i] = referenceRoot:getObjectByName(bone.name)
				end
			end
			---@diagnostic disable-next-line
			referenceRoot:getObjectByName("Bip01"):attachChild(shape)
		end
	end
end

local function onLoaded()
	local mesh = tes3.loadMesh("c\\c_m_helseth_robe.nif"):clone() --[[@as niNode]]
	attachMesh(mesh, tes3.player)
end
event.register(tes3.event.loaded, onLoaded)
