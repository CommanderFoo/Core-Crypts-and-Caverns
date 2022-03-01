local MAPS = require(script:GetCustomProperty("CryptsAndCaverns"))
local Crypts_Caverns_Parser = require(script:GetCustomProperty("Crypts_Caverns_Parser"))

local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local FLOOR = script:GetCustomProperty("Floor")
local NOTHING = script:GetCustomProperty("Nothing")
local WALL = script:GetCustomProperty("Wall")
local ROOF = script:GetCustomProperty("Roof")

local objs = {}

local function get_neighbours(map_2d, row, column)
	local tiles = {

		SELF = map_2d[row][column],

		NORTH = map_2d[row - 1][column],
		EAST = map_2d[row][column + 1],
		SOUTH = map_2d[row + 1][column],
		WEST = map_2d[row][column - 1],

		NORTH_EAST = map_2d[row - 1][column + 1],
		SOUTH_EAST = map_2d[row + 1][column + 1],
		SOUTH_WEST = map_2d[row - 1][column - 1],
		NORTH_WEST = map_2d[row + 1][column - 1]

	}

	return tiles
end

local function clear_objs()
	for i, obj in ipairs(objs) do
		obj:Destroy()
	end

	objs = {}
end

local function generate()
	local parser = Crypts_Caverns_Parser:new(MAPS[math.random(#MAPS)].metadata)
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

	local floor = World.SpawnAsset(FLOOR, opts)

	opts.rotation = Rotation.New(180, 0, 0)
	opts.position = Vector3.New(0, 0, tile_size - 10)

	local roof = World.SpawnAsset(ROOF, opts)

	floor:SetColor(Color.FromStandardHex(parser:get_floor_color()))
	roof:SetColor(Color.FromStandardHex(parser:get_floor_color()))

	table.insert(objs, floor)
	table.insert(objs, roof)

	for row = 1, #map_2d do
		for column = 1, #map_2d[1] do
			if(map_2d[row][column] ~= "-") then
				local neighbours = get_neighbours(map_2d, row, column)
				local tile_asset = WALL
				local color = map_2d[row][column]

				if((neighbours.NORTH == neighbours.SOUTH and (neighbours.NORTH ~= "-" and neighbours.SOUTH ~= "-")) and (neighbours.WEST == neighbours.EAST) and (neighbours.EAST ~= "-" and neighbours.WEST ~= "-")) then
					tile_asset = NOTHING
				else
					totals[color] = (totals[color] and (totals[color] + 1)) or 1
				end

				if(tile_asset ~= nil) then
					local tile = World.SpawnAsset(tile_asset, { parent = GENERATED_MAP, networkContext = NetworkContextType.LOCAL_CONTEXT, position = Vector3.New(-(tile_size * row - offset), tile_size * column - offset, 0) , scale = Vector3.New(tile_size / 100, tile_size / 100, tile_size / 100) })

					tile.name = map_2d[row][column]
					tile:SetColor(Color.FromStandardHex(color))

					table.insert(objs, tile)
				end
			end
		end
	end

	for color, total in pairs(totals) do
		print(color, total)
	end
end

Input.actionPressedEvent:Connect(function(player, action, value)
	if(action == "Generate") then
		print("Ok")
		generate()
	end
end)

generate()