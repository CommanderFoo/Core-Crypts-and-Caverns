local MAPS = require(script:GetCustomProperty("CryptsAndCaverns"))
local Crypts_Caverns_Parser = require(script:GetCustomProperty("Crypts_Caverns_Parser"))

local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local TILES = require(script:GetCustomProperty("Tiles"))

local objs = {}

local function get_tile(map_2d, x, y)
	local row = map_2d[x]

	if(row) then
		return row[y]
	end
end

local function get_neighbours(map_2d, row, column)
	-- if(map_2d[row - 1] == nil or map_2d[row + 1] == nil or map_2d[row][column - 1] == nil or map_2d[row][column + 1] == nil) then
	-- 	return nil	
	-- end

	local tiles = {

		SELF = get_tile(map_2d, row, column),
		NORTH = get_tile(map_2d, row - 1, column),
		EAST = get_tile(map_2d, row, column + 1),
		SOUTH = get_tile(map_2d, row + 1, column),
		WEST = get_tile(map_2d, row, column - 1),
		NORTH_EAST = get_tile(map_2d, row - 1, column + 1),
		NORTH_WEST = get_tile(map_2d, row - 1, column - 1),
		SOUTH_EAST = get_tile(map_2d, row + 1, column + 1),
		SOUTH_WEST = get_tile(map_2d, row + 1, column - 1)

	}

	-- local tiles = {

	-- 	SELF = map_2d[row][column],

	-- 	NORTH = map_2d[row - 1][column],
	-- 	EAST = map_2d[row][column + 1],
	-- 	SOUTH = map_2d[row + 1][column],
	-- 	WEST = map_2d[row][column - 1],

	-- 	NORTH_EAST = map_2d[row + 1][column + 1],
	-- 	NORTH_WEST = map_2d[row + 1][column - 1],
	-- 	SOUTH_EAST = map_2d[row - 1][column + 1],
	-- 	SOUTH_WEST = map_2d[row - 1][column - 1]		

	-- }

	return tiles
end

local function clear_objs()
	for i, obj in ipairs(objs) do
		obj:Destroy()
	end

	objs = {}
end

local function generate()
	local index = math.random(#MAPS)
	local map = MAPS[index]

	print("NFT ID:", map.map_id, "Index:", index)

	local parser = Crypts_Caverns_Parser:new(map.metadata)
	local map_2d = parser:get_map()

	print(parser:get_svg_data())
	parser:print()

	clear_objs()

	local totals = {}

	local tile_size = 1000
	local width = tile_size * #map_2d
	local height = tile_size * #map_2d[1]
	local offset = width / 2

	local opts = {
		
		parent = GENERATED_MAP,
		networkContext = NetworkContextType.LOCAL_CONTEXT,
		scale = Vector3.New(width / 100, height / 100, 1)

	}

	local floor = World.SpawnAsset(TILES["floor"].asset, opts)

	opts.rotation = Rotation.New(180, 0, 0)
	opts.position = Vector3.New(0, 0, tile_size - 10)

	local roof = World.SpawnAsset(TILES["roof"].asset, opts)

	floor:SetColor(Color.FromStandardHex(parser:get_floor_color()))
	roof:SetColor(Color.FromStandardHex(parser:get_floor_color()))

	table.insert(objs, floor)
	table.insert(objs, roof)

	-- for row = 1, #map_2d do
	-- 	for column = 1, #map_2d[1] do
	-- 		local tile_se = get_tile(map_2d, row, column)
	-- 		local tile_nw = get_tile(map_2d, row - 1, column - 1)
	-- 		local tile_ne = get_tile(map_2d, row, column - 1)
	-- 		local tile_sw = get_tile(map_2d, row, column - 1)
	-- 		local color = map_2d[row][column]

	-- 		if(tile_se ~= "-") then
	-- 	end
	-- end

	for row = 1, #map_2d do
		for column = 1, #map_2d[1] do
			local neighbours = get_neighbours(map_2d, row, column)
			local color = map_2d[row][column]
			local tile_asset = color ~= "-" and TILES["wall"].asset or nil
			local rotation = Rotation.New()

			if(color ~= "-") then
				-- if(neighbours and (neighbours.NORTH == neighbours.SOUTH and (neighbours.NORTH ~= "-" and neighbours.SOUTH ~= "-")) and (neighbours.WEST == neighbours.EAST) and (neighbours.EAST ~= "-" and neighbours.WEST ~= "-")) then
				-- 	tile_asset = TILES["empty"].asset
				-- else
				-- 	totals[color] = (totals[color] and (totals[color] + 1)) or 1
				-- end

				totals[color] = (totals[color] and (totals[color] + 1)) or 1

				-- if(neighbours and (neighbours.NORTH == neighbours.SOUTH and (neighbours.NORTH == "-" and neighbours.SOUTH == "-")) and (neighbours.WEST == neighbours.EAST) and (neighbours.EAST == "-" and neighbours.WEST == "-")) then
				-- 	tile_asset = TILES["empty"].asset
				-- else
				-- 	totals[color] = (totals[color] and (totals[color] + 1)) or 1
				-- end
			elseif(neighbours) then
				if((neighbours.WEST ~= "-" and neighbours.NORTH_WEST ~= "-" and neighbours.NORTH ~= "-")) then
					tile_asset = TILES["wall corner"].asset
				end

				if((neighbours.EAST ~= "-" and neighbours.NORTH_EAST ~= "-" and neighbours.NORTH ~= "-")) then
					tile_asset = TILES["wall corner"].asset
					rotation.z = 90
				end

				if((neighbours.EAST ~= "-" and neighbours.SOUTH_EAST ~= "-" and neighbours.SOUTH ~= "-")) then
					tile_asset = TILES["wall corner"].asset
					rotation.z = 180
				end

				if((neighbours.WEST ~= "-" and neighbours.SOUTH_WEST ~= "-" and neighbours.SOUTH ~= "-")) then
					tile_asset = TILES["wall corner"].asset
					rotation.z = 270
				end

				-- if((neighbours.NORTH ~= "-" and neighbours.NORTH_EAST ~= "-" and neighbours.EAST ~= "-")) then
				-- 	tile_asset = TILES["wall corner"].asset
				-- end

				-- if((neighbours.SOUTH_EAST ~= "-" and neighbours.SOUTH ~= "-" and neighbours.SOUTH_EAST ~= "-")) then
				-- 	tile_asset = TILES["wall corner"].asset
				-- end

				-- if((neighbours.EAST ~= "-" and neighbours.SOUTH_EAST ~= "-" and neighbours.WEST ~= "-")) then
				-- 	tile_asset = TILES["wall corner"].asset
				-- end
			end

			if(tile_asset ~= nil) then
				local tile = World.SpawnAsset(tile_asset, { 
					
					parent = GENERATED_MAP, 
					networkContext = NetworkContextType.LOCAL_CONTEXT, 
					position = Vector3.New(-(tile_size * row - offset), tile_size * column - offset, 0),
					scale = Vector3.New(tile_size / 100, tile_size / 100, tile_size / 100),
					rotation = rotation
				
				})

				tile.name = "x " .. row .. " y " .. column

				if(color ~= "-") then
					tile:SetColor(Color.FromStandardHex(color))
				end

				table.insert(objs, tile)
			end
		end

		Task.Wait()
	end

	for color, total in pairs(totals) do
		--print(color, total)
	end
end

Input.actionPressedEvent:Connect(function(player, action, value)
	if(action == "Generate") then
		generate()
	end
end)

generate()