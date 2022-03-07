local MAPS = require(script:GetCustomProperty("CryptsAndCaverns"))
local PLAYER_SPAWN_POINTS = require(script:GetCustomProperty("PlayerSpawnPoints"))
local ENEMY_SPAWN_POINTS = require(script:GetCustomProperty("EnemySpawnPoints"))
local ENEMIES = require(script:GetCustomProperty("Enemies"))

local Crypts_Caverns_Parser = require(script:GetCustomProperty("Crypts_Caverns_Parser"))

local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local TILES = require(script:GetCustomProperty("Tiles"))
local ASSETS = require(script:GetCustomProperty("Assets"))
local NAV_MESH_AREA = script:GetCustomProperty("NavMeshArea"):WaitForObject()
local DATA = script:GetCustomProperty("Data"):WaitForObject()

local THE_CARLOS_BLADE = script:GetCustomProperty("TheCarlosBlade")

local objs = {}
local tile_size = 1000
local enemies = {}
local map_id = nil

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

local function create_floor_roof_navmesh(width)
	local opts = {

		parent = GENERATED_MAP,
		networkContext = NetworkContextType.LOCAL_CONTEXT,
		scale = Vector3.New(width / 100, width / 100, 1)

	}

	local floor = World.SpawnAsset(TILES["floor"].asset, opts)

	opts.rotation = Rotation.New(180, 0, 0)
	opts.position = Vector3.New(0, 0, tile_size - 10)

	local roof = World.SpawnAsset(TILES["roof"].asset, opts)

	NAV_MESH_AREA:SetWorldScale(opts.scale + (Vector3.UP * 1))
	NAV_MESH_AREA:SetWorldPosition(floor:GetWorldPosition())

	table.insert(objs, floor)
	table.insert(objs, roof)
end

local function reset_nav_mesh_progress()
	DATA:SetCustomProperty("progress_grid", 0)
	DATA:SetCustomProperty("progress_mesh", 0)
end

local function cleanup()
	for i, obj in ipairs(objs) do
		obj:Destroy()
	end

	objs = {}

	reset_nav_mesh_progress()
	map_id = nil
end

local function get_map()
	local index = math.random(#MAPS)
	local selected_map = MAPS[index]
	local parser = Crypts_Caverns_Parser:new(selected_map.metadata)

	map_id = selected_map.map_id

	print("NFT ID:", selected_map.map_id, "Index:", index)
	--print(parser:get_svg_data())
	parser:print()

	return selected_map, parser:get_map()
end

local function spawn_loot(parent, context, tile)
	local loot = World.SpawnAsset(ASSETS["loot chest"].asset, {

		parent = parent,
		networkContext = context,
		position = tile:GetWorldPosition() * Vector3.New(1, 1, 0) + (tile:GetWorldTransform():GetForwardVector() * -50) + (Vector3.UP * 50),
		rotation = tile:GetChildren()[1]:GetWorldRotation(),
		scale = Vector3.New(2, 2, 2)

	})

	table.insert(objs, loot)
end

local function get_random_spawn_point()
	local points = {}

	for i, e in pairs(PLAYER_SPAWN_POINTS) do
		if(e.map_id == map_id) then
			table.insert(points, e.point)
		end
	end

	return points[math.random(#points)]
end

local function spawn_player()
	for i, player in ipairs(Game.GetPlayers()) do
		local point = get_random_spawn_point()

		player:SetWorldPosition(Vector3.New(point.x, point.y, point.z))
		player:SetWorldRotation(Rotation.New(0, 0, point.w))

		player:ActivateWalking()

		local weapon = World.SpawnAsset(THE_CARLOS_BLADE, { networkContext = NetworkContextType.NETWORKED })
	
		weapon:Equip(player)

		player.diedEvent:Connect(function()
			Task.Wait(1)
			player:SetWorldPosition(Vector3.New(point.x, point.y, point.z))
			player:SetWorldRotation(Rotation.New(0, 0, point.w))
			player:Spawn()
		end)
	end
end

local function spawn_enemies()
	for e, entry in pairs(ENEMY_SPAWN_POINTS) do
		local enemy = World.SpawnAsset(ENEMIES[math.random(#ENEMIES)].asset, {
			
			networkContext = NetworkContextType.NETWORKED,
			position = Vector3.New(entry.point.x, entry.point.y, 50),
			rotation = Rotation.New(0, 0, entry.point.w)
		
		})

		enemies[enemy.id] = enemy

		local evt = nil

		evt = enemy.destroyEvent:Connect(function()
			enemies[enemy.id] = nil
			evt:Disconnect()
		end)
	end
end

local function generate()
	cleanup()
	
	local selected_map, map = get_map()
	local width = tile_size * #map
	local offset = width / 2

	create_floor_roof_navmesh(width)

	for row = 1, #map do
		for column = 1, #map[1] do
			local neighbours = get_neighbours(map, row, column)
			local color = map[row][column]
			local tile_asset = color ~= "-" and TILES["wall"] or nil
			local rotation = Rotation.New()
			local can_spawn_loot = false

			if(color ~= "-") then
				if(neighbours.NORTH == "-" and neighbours.NORTH_EAST == "-" and neighbours.EAST == "-" and neighbours.SOUTH == "-" and neighbours.SOUTH_WEST == "-" and neighbours.WEST == "-") then
					tile_asset = TILES["wall pillar"]
				-- elseif(neighbours.NORTH == "-" and neighbours.NORTH_EAST == "-" and neighbours.EAST == "-") then
				-- 	tile_asset = TILES["wall end"]
				-- elseif(neighbours.SOUTH == "-" and neighbours.SOUTH_EAST == "-" and neighbours.EAST == "-") then
				-- 	tile_asset = TILES["wall end"]
				-- 	rotation.z = 90
				-- elseif(neighbours.SOUTH == "-" and neighbours.SOUTH_WEST == "-" and neighbours.WEST == "-") then
				-- 	tile_asset = TILES["wall end"]
				-- 	rotation.z = 180
				-- elseif(neighbours.NORTH == "-" and neighbours.NORTH_WEST == "-" and neighbours.WEST == "-") then
				-- 	tile_asset = TILES["wall end"]
				-- 	rotation.z = -90
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
							can_spawn_loot = true
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

				tile.name = color or "-"
				table.insert(objs, tile)

				if(can_spawn_loot) then
					spawn_loot(parent, context, tile)
				end
			end
		end

		Task.Wait()
	end

	Events.Broadcast("generate_navmesh")
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

	spawn_player()
	spawn_enemies()
end)

Events.Connect("navmesh_progress_grid", function(v)
	DATA:SetCustomProperty("progress_grid", v)
end)

Events.Connect("navmesh_progress_mesh", function(v)
	DATA:SetCustomProperty("progress_grid", 1)
	DATA:SetCustomProperty("progress_mesh", v)
end)