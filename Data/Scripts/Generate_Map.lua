local MAPS = require(script:GetCustomProperty("CryptsAndCaverns"))
local Crypts_Caverns_Parser = require(script:GetCustomProperty("Crypts_Caverns_Parser"))

local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local TILES = require(script:GetCustomProperty("Tiles"))
local ASSETS = require(script:GetCustomProperty("Assets"))

local objs = {}

local function get_tile(map_2d, x, y)
	local row = map_2d[x]

	if(row) then
		return row[y]
	end

	return "-"
end

local function get_neighbours(map_2d, row, column)
	return {

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

	for row = 1, #map_2d do
		for column = 1, #map_2d[1] do
			local neighbours = get_neighbours(map_2d, row, column)
			local color = map_2d[row][column]
			local tile_asset = color ~= "-" and TILES["wall"] or nil
			local rotation = Rotation.New()

			if(color ~= "-") then
				totals[color] = (totals[color] and (totals[color] + 1)) or 1

				if(neighbours.SELF ~= "-" and neighbours.NORTH == "-" and neighbours.NORTH_EAST == "-" and neighbours.EAST == "-" and neighbours.SOUTH == "-" and neighbours.SOUTH_WEST == "-" and neighbours.WEST == "-") then
					tile_asset = TILES["wall pillar"]
				elseif(neighbours.SELF ~= "-" and neighbours.NORTH == "-" and neighbours.NORTH_EAST == "-" and neighbours.EAST == "-") then
					tile_asset = TILES["wall end"]
				end
			else
				if(neighbours.WEST ~= "-" and neighbours.NORTH_WEST ~= "-" and neighbours.NORTH ~= "-") then
					tile_asset = TILES["wall corner"]
					rotation.z = -90
				elseif(neighbours.NORTH ~= "-" and neighbours.NORTH_EAST ~= "-" and neighbours.EAST ~= "-") then
					tile_asset = TILES["wall corner"]
				elseif(neighbours.EAST ~= "-" and neighbours.SOUTH_EAST ~= "-" and neighbours.SOUTH ~= "-") then
					tile_asset = TILES["wall corner"]
					rotation.z = 90
				elseif(neighbours.SOUTH ~= "-" and neighbours.SOUTH_WEST ~= "-" and neighbours.WEST ~= "-") then
					tile_asset = TILES["wall corner"]
					rotation.z = 180
				end
			end

			if(tile_asset ~= nil) then
				local tile = World.SpawnAsset(tile_asset.asset, { 
					
					parent = GENERATED_MAP, 
					networkContext = NetworkContextType.LOCAL_CONTEXT, 
					position = Vector3.New(-(tile_size * row - offset), tile_size * column - offset, 0),
					scale = Vector3.New(tile_size / 100, tile_size / 100, tile_size / 100),
					rotation = rotation
				
				})

				tile.name = "x " .. row .. " y " .. column

				-- if(color ~= "-") then
				-- 	for i, c in ipairs(tile:GetChildren()) do
				-- 		c:SetColor(Color.FromStandardHex(color))
				-- 	end
				-- end

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