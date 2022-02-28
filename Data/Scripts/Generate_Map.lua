local MAPS = require(script:GetCustomProperty("CryptsAndCavens"))
local Crypts_Cavens_Parser = require(script:GetCustomProperty("Crypts_Cavens_Parser"))

local parser = Crypts_Cavens_Parser:new(MAPS[1].metadata)
local map_2d = parser:get_map()

parser:print()

local CUBE_TILE = script:GetCustomProperty("CubeTile")
local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local FLOOR = script:GetCustomProperty("Floor"):WaitForObject()

local tile_size = 500
local width = tile_size * #map_2d
local height = tile_size * #map_2d[1]
local offset = width / 2

FLOOR:SetWorldScale(Vector3.New(width, height, 1))

for row = 1, #map_2d do
	for column = 1, #map_2d[1] do
		if(map_2d[row][column] ~= "-") then
			World.SpawnAsset(CUBE_TILE, { parent = GENERATED_MAP, networkContext = NetworkContextType.LOCAL_CONTEXT, position = Vector3.New(tile_size * row - offset, tile_size * column - offset, 0), scale = Vector3.New(tile_size / 100, tile_size / 100, tile_size / 100) })
		end
	end
end