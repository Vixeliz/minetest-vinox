local WATER_ALPHA = "^[opacity:" .. 160
local WATER_VISC = 1
local LAVA_VISC = 7

--
-- Node definitions
--

-- Register nodes

minetest.register_node("vinox_core:stone", {
	description = "Stone",
	tiles = {"stone.png"},
	groups = {cracky=3},
})

minetest.register_node("vinox_core:sandstone", {
	description = "Sand Stone",
	tiles = {"sandstone.png"},
	groups = {cracky=3},
})

crafting.register_recipe({
	type = "inv",
	output = "vinox_core:sandstone",
	items = {
		"vinox_core:stone 1",
		"vinox_core:sand 1"
	},
	always_known = true,
});

minetest.register_node("vinox_core:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles ={"grass_top.png",
		-- a little dot on the bottom to distinguish it from dirt
		"dirt.png",
		{name = "dirt.png^grass_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("vinox_core:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles ={"vinox_dirt_with_snow.png",
		-- a little dot on the bottom to distinguish it from dirt
		"dirt.png^vinox_dirt_with_snow_bottom.png",
		{name = "dirt.png^default_snow_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("vinox_core:dirt", {
	description = "Dirt",
	tiles ={"dirt.png"},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("vinox_core:sand", {
	description = "Sand",
	tiles ={"sand.png"},
	groups = {crumbly=3, falling_node = 1},
})

minetest.register_node("vinox_core:desert_sand", {
	description = "Desert Sand",
	tiles ={"default_desert_sand.png"},
	groups = {crumbly=3},
})

minetest.register_node("vinox_core:gravel", {
	description = "Gravel",
	tiles ={"default_gravel.png"},
	groups = {crumbly=2, falling_node = 1},
})

minetest.register_node("vinox_core:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	tiles ={"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=3},
})

minetest.register_node("vinox_core:tree", {
	description = "Normal Tree Trunk",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1},
})

minetest.register_node("vinox_core:leaves", {
	description = "Normal Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3},
})

minetest.register_node("vinox_core:jungletree", {
	description = "Jungle Tree Trunk",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1},
})

minetest.register_node("vinox_core:jungleleaves", {
	description = "Jungle Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_jungleleaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3},
})

minetest.register_node("vinox_core:pine_tree", {
	description = "Pine Tree Trunk",
	tiles = {"default_pine_tree_top.png", "default_pine_tree_top.png", "default_pine_tree.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=1},
})

minetest.register_node("vinox_core:pine_needles", {
	description = "Pine Needles",
	drawtype = "allfaces_optional",
	tiles = {"default_pine_needles.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3},
})

minetest.register_node("vinox_core:water_source", {
	description = "Water Source".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "liquid",
	waving = 3,
	tiles = {"water-source-static.png"..WATER_ALPHA},
	special_tiles = {
		{name = "water-source-static.png"..WATER_ALPHA, backface_culling = false},
		{name = "water-source-static.png"..WATER_ALPHA, backface_culling = true},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "vinox_core:water_flowing",
	liquid_alternative_source = "vinox_core:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node("vinox_core:water_flowing", {
	description = "Flowing Water".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"water-flowing-static.png"},
	special_tiles = {
		{name = "water-flowing-static.png"..WATER_ALPHA,
			backface_culling = false},
		{name = "water-flowing-static.png"..WATER_ALPHA,
			backface_culling = false},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "vinox_core:water_flowing",
	liquid_alternative_source = "vinox_core:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node("vinox_core:river_water_source", {
	description = "River Water Source".."\n"..
		"Swimmable, spreading, non-renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "liquid",
	waving = 3,
	tiles = { "default_river_water.png"..WATER_ALPHA },
	special_tiles = {
		{name = "default_river_water.png"..WATER_ALPHA, backface_culling = false},
		{name = "default_river_water.png"..WATER_ALPHA, backface_culling = true},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "vinox_core:river_water_flowing",
	liquid_alternative_source = "vinox_core:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, },
})

minetest.register_node("vinox_core:river_water_flowing", {
	description = "Flowing River Water".."\n"..
		"Swimmable, spreading, non-renewable liquid".."\n"..
		"Drowning damage: 1",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_river_water_flowing.png"..WATER_ALPHA},
	special_tiles = {
		{name = "default_river_water_flowing.png"..WATER_ALPHA,
			backface_culling = false},
		{name = "default_river_water_flowing.png"..WATER_ALPHA,
			backface_culling = false},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "vinox_core:river_water_flowing",
	liquid_alternative_source = "vinox_core:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, },
})

minetest.register_node("vinox_core:lava_flowing", {
	description = "Flowing Lava".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"4 damage per second".."\n"..
		"Drowning damage: 1",
	drawtype = "flowingliquid",
	tiles = {"default_lava_flowing.png"},
	special_tiles = {
		{name="default_lava_flowing.png", backface_culling = false},
		{name="default_lava_flowing.png", backface_culling = false},
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	damage_per_second = 4,
	liquidtype = "flowing",
	liquid_alternative_flowing = "vinox_core:lava_flowing",
	liquid_alternative_source = "vinox_core:lava_source",
	liquid_viscosity = LAVA_VISC,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=1},
})

minetest.register_node("vinox_core:lava_source", {
	description = "Lava Source".."\n"..
		"Swimmable, spreading, renewable liquid".."\n"..
		"4 damage per second".."\n"..
		"Drowning damage: 1",
	drawtype = "liquid",
	tiles = { "default_lava.png" },
	special_tiles = {
		{name = "default_lava.png", backface_culling = false},
		{name = "default_lava.png", backface_culling = true},
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	damage_per_second = 4,
	liquidtype = "source",
	liquid_alternative_flowing = "vinox_core:lava_flowing",
	liquid_alternative_source = "vinox_core:lava_source",
	liquid_viscosity = LAVA_VISC,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=1},
})

minetest.register_node("vinox_core:cobblestone", {
	description = "Cobblestone",
	tiles ={"cobblestone.png"},
	is_ground_content = false,
	groups = {cracky=3},
})

-- Make type not inv eventually. Something like a stone cutter
crafting.register_recipe({
	type = "inv",
	output = "vinox_core:cobblestone",
	items = {
		"vinox_core:stone 1",
	},
	always_known = true,
});

minetest.register_node("vinox_core:mossy_cobblestone", {
	description = "Mossy Cobblestone",
	tiles ={
		"mossy_cobblestone_top.png",
		"mossy_cobblestone_top.png",
		"mossy_cobblestone.png"
	},
	is_ground_content = false,
	groups = {cracky=3},
})

crafting.register_recipe({
	type = "inv",
	output = "vinox_core:mossy_cobblestone",
	items = {
		"vinox_core:cobblestone 1",
		"vinox_core:dirt_with_grass 1",
	},
	always_known = true,
});

minetest.register_node("vinox_core:apple", {
	description = "Apple".."\n"..
		"Punch: Eat (+2)",
	drawtype = "plantlike",
	tiles ={"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	groups = {dig_immediate=3},

	-- Make eatable because why not?
	on_use = minetest.item_eat(2),
})

minetest.register_node("vinox_core:ice", {
	description = "Ice",
	tiles ={"default_ice.png"},
	groups = {cracky=3},
})

-- The snow nodes intentionally have different tints to make them more
-- distinguishable
minetest.register_node("vinox_core:snow", {
	description = "Snow Sheet",
	tiles = {"vinox_snow_sheet.png"},
	groups = {crumbly=3},
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
	},
})

minetest.register_node("vinox_core:snowblock", {
	description = "Snow Block",
	tiles ={"default_snow.png"},
	groups = {crumbly=3},
})
