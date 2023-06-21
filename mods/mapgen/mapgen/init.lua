--
-- Aliases for map generator outputs
--

-- ESSENTIAL node aliases
-- Basic nodes
minetest.register_alias("mapgen_stone", "vinox_core:stone")
minetest.register_alias("mapgen_water_source", "vinox_core:water_source")
minetest.register_alias("mapgen_river_water_source", "vinox_core:river_water_source")

-- Additional essential aliases for v6
minetest.register_alias("mapgen_lava_source", "vinox_core:lava_source")
minetest.register_alias("mapgen_dirt", "vinox_core:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "vinox_core:dirt_with_grass")
minetest.register_alias("mapgen_sand", "vinox_core:sand")
minetest.register_alias("mapgen_tree", "vinox_core:tree")
minetest.register_alias("mapgen_leaves", "vinox_core:leaves")
minetest.register_alias("mapgen_apple", "vinox_core:apple")

-- Essential alias for dungeons
minetest.register_alias("mapgen_cobble", "vinox_core:cobble")

-- Optional aliases for v6 (they all have fallback values in the engine)
if minetest.settings:get_bool("devtest_v6_mapgen_aliases", true) then
	minetest.register_alias("mapgen_gravel", "vinox_core:gravel")
	minetest.register_alias("mapgen_desert_stone", "vinox_core:sandstone")
	minetest.register_alias("mapgen_desert_sand", "vinox_core:desert_sand")
	minetest.register_alias("mapgen_dirt_with_snow", "vinox_core:dirt_with_snow")
	minetest.register_alias("mapgen_snowblock", "vinox_core:snowblock")
	minetest.register_alias("mapgen_snow", "vinox_core:snow")
	minetest.register_alias("mapgen_ice", "vinox_core:ice")
	minetest.register_alias("mapgen_junglegrass", "vinox_core:junglegrass")
	minetest.register_alias("mapgen_jungletree", "vinox_core:jungletree")
	minetest.register_alias("mapgen_jungleleaves", "vinox_core:jungleleaves")
	minetest.register_alias("mapgen_pine_tree", "vinox_core:pine_tree")
	minetest.register_alias("mapgen_pine_needles", "vinox_core:pine_needles")
end
-- Optional alias for mossycobble (should fall back to cobble)
if minetest.settings:get_bool("devtest_dungeon_mossycobble", true) then
	minetest.register_alias("mapgen_mossycobble", "vinox_core:mossycobble")
end
-- Optional aliases for dungeon stairs (should fall back to full nodes)
if minetest.settings:get_bool("devtest_dungeon_stairs", true) then
	minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
	if minetest.settings:get_bool("devtest_v6_mapgen_aliases", true) then
		minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")
	end
end

--
-- Register biomes for biome API
--

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()

if minetest.settings:get_bool("devtest_register_biomes", true) then
	minetest.register_biome({
		name = "mapgen:grassland",
		node_top = "vinox_core:dirt_with_grass",
		depth_top = 1,
		node_filler = "vinox_core:dirt",
		depth_filler = 1,
		node_riverbed = "vinox_core:sand",
		depth_riverbed = 2,
		node_dungeon = "vinox_core:cobble",
		node_dungeon_alt = "vinox_core:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 4,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mapgen:grassland_ocean",
		node_top = "vinox_core:sand",
		depth_top = 1,
		node_filler = "vinox_core:sand",
		depth_filler = 3,
		node_riverbed = "vinox_core:sand",
		depth_riverbed = 2,
		node_cave_liquid = "vinox_core:water_source",
		node_dungeon = "vinox_core:cobble",
		node_dungeon_alt = "vinox_core:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 3,
		y_min = -255,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "mapgen:grassland_under",
		node_cave_liquid = {"vinox_core:water_source", "vinox_core:lava_source"},
		node_dungeon = "vinox_core:cobble",
		node_dungeon_alt = "vinox_core:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 50,
		humidity_point = 50,
	})
end
