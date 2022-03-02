local PROGRESS = script:GetCustomProperty("Progress"):WaitForObject()
local DATA = script:GetCustomProperty("Data"):WaitForObject()

local function update(obj, key)
	if(key == "progress_grid" or key == "progress_mesh") then
		local g = DATA:GetCustomProperty("progress_grid")
		local m = DATA:GetCustomProperty("progress_mesh")

		PROGRESS.text = string.format("Nav Mesh\n%i%%/%i%%", math.min(100, CoreMath.Round(g * 100)), math.min(100, CoreMath.Round(m * 100)))
	end
end

DATA.customPropertyChangedEvent:Connect(update)