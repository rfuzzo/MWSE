
--- @param cell tes3cell
--- @param cellVisitTable table<tes3cell, boolean>|nil
--- @return tes3cell?
local function getExteriorCell(cell, cellVisitTable)
	if cell.isOrBehavesAsExterior then
		return cell
	end

	-- A hashset of cells that have already been checked, to prevent infinite loops and redundant checks.
	cellVisitTable = cellVisitTable or {}
	if (cellVisitTable[cell]) then
		return
	end
	cellVisitTable[cell] = true

	for ref in cell:iterateReferences(tes3.objectType.door) do
		if ref.destination and ref.destination.cell then
			local linkedExterior = getExteriorCell(ref.destination.cell, cellVisitTable)
			if (linkedExterior) then
				return linkedExterior
			end
		end
	end
end

--- @param self tes3cell
--- @return tes3cell?
function tes3cell:getExteriorCell()
	return getExteriorCell(self)
end
