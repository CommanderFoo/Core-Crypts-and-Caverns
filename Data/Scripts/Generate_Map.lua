local MAPS = require(script:GetCustomProperty("CryptsAndCaverns"))
local Crypts_Caverns_Parser = require(script:GetCustomProperty("Crypts_Caverns_Parser"))

local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local TILES = require(script:GetCustomProperty("Tiles"))
local ASSETS = require(script:GetCustomProperty("Assets"))
local NAV_MESH_AREA = script:GetCustomProperty("NavMeshArea"):WaitForObject()
local DATA = script:GetCustomProperty("Data"):WaitForObject()

local objs = {}
local current_map = nil

local function get_tile(map_2d, x, y)
	local row = map_2d[x]

	if(row) then
		return row[y]
	end

	return nil
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
	DATA:SetCustomProperty("progress_grid", 0)
	DATA:SetCustomProperty("progress_mesh", 0)

	local index = math.random(#MAPS)
	
	current_map = MAPS[4]
	
	print("NFT ID:", current_map.map_id, "Index:", index)

	local parser = Crypts_Caverns_Parser:new(current_map.metadata)
	local map_2d = parser:get_map()

	parser:print()

	clear_objs()

	local totals = {}

	local tile_size = 1000
	local width = tile_size * #map_2d
	local offset = width / 2

	local opts = {
		
		parent = GENERATED_MAP,
		networkContext = NetworkContextType.LOCAL_CONTEXT,
		scale = Vector3.New(width / 100, width / 100, 1)

	}

	local floor = World.SpawnAsset(TILES["floor"].asset, opts)

	opts.rotation = Rotation.New(180, 0, 0)
	opts.position = Vector3.New(0, 0, tile_size - 10)

	--local roof = World.SpawnAsset(TILES["roof"].asset, opts)

	--floor:SetColor(Color.FromStandardHex(parser:get_floor_color()))
	--roof:SetColor(Color.FromStandardHex(parser:get_floor_color()))

	NAV_MESH_AREA:SetWorldScale(opts.scale + (Vector3.UP * 1))
	NAV_MESH_AREA:SetWorldPosition(floor:GetWorldPosition())
	table.insert(objs, floor)
	--table.insert(objs, roof)

	for row = 1, #map_2d do
		for column = 1, #map_2d[1] do
			local neighbours = get_neighbours(map_2d, row, column)
			local color = map_2d[row][column]
			local tile_asset = color ~= "-" and TILES["wall"] or nil
			local rotation = Rotation.New()
			local spawn_loot = false

			if(color ~= "-") then
				totals[color] = (totals[color] and (totals[color] + 1)) or 1

				if(neighbours.NORTH == "-" and neighbours.NORTH_EAST == "-" and neighbours.EAST == "-" and neighbours.SOUTH == "-" and neighbours.SOUTH_WEST == "-" and neighbours.WEST == "-") then
					tile_asset = TILES["wall pillar"]
				elseif(neighbours.NORTH == "-" and neighbours.NORTH_EAST == "-" and neighbours.EAST == "-") then
					--tile_asset = TILES["wall end"]
				end
			else
				if(neighbours.NORTH ~= nil and neighbours.SOUTH ~= nil and neighbours.WEST ~= nil and neighbours.EAST ~= nil) then
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

					if(tile_asset ~= nil) then
						local rng = math.random(1, 100)

						if(rng < 50) then
							spawn_loot = true
						end
					end
				end
			end

			if(tile_asset ~= nil) then
				local z_offset = 0
				local parent = GENERATED_MAP
				local context = NetworkContextType.LOCAL_CONTEXT

				local tile = World.SpawnAsset(tile_asset.asset, { 
					
					parent = parent, 
					networkContext = context, 
					position = Vector3.New(-(tile_size * row - offset), tile_size * column - offset, z_offset),
					scale = Vector3.New(tile_size / 100, tile_size / 100, tile_size / 100),
					rotation = rotation
				
				})

				table.insert(objs, tile)

				if(spawn_loot) then
					local loot = World.SpawnAsset(ASSETS["loot chest"].asset, { 
					
						parent = parent, 
						networkContext = context, 
						position = tile:GetWorldPosition() * Vector3.New(1, 1, 0) + (tile:GetWorldTransform():GetForwardVector() * -50) + (Vector3.UP * 50),
						rotation = tile:GetChildren()[1]:GetWorldRotation(),
						scale = Vector3.New(2, 2, 2)
					
					})

					table.insert(objs, loot)
				end
			end
		end

		Task.Wait()
	end

	--Events.Broadcast("generate_navmesh")

	for index, player in ipairs(Game.GetPlayers()) do
		player:Spawn({ rotation = current_map.player_rotation, position = current_map.player_position })
	end
end

Input.actionPressedEvent:Connect(function(player, action, value)
	if(action == "Generate") then
		generate()
	end
end)

generate()

Events.Connect("navmesh_generated", function()
	DATA:SetCustomProperty("progress_grid", 1)
	DATA:SetCustomProperty("progress_mesh", 1)


end)

Events.Connect("navmesh_progress_grid", function(v)
	DATA:SetCustomProperty("progress_grid", v)
end)

Events.Connect("navmesh_progress_mesh", function(v)
	DATA:SetCustomProperty("progress_grid", 1)
	DATA:SetCustomProperty("progress_mesh", v)
end)