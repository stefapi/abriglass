
-- undecorated coloured glass, all using plain glass texture
local glass_list = {
	{"black", "Darkened", "292421",}, {"blue", "Blue", "0000FF",},
	{"cyan", "Cyan", "00FFFF",}, {"green", "Green", "00FF00",}, 
	{"magenta", "Magenta", "FF00FF",}, {"orange", "Orange", "FF6103",}, 
	{"purple", "Purple", "800080",}, {"red", "Red", "FF0000",}, 
	{"yellow", "Yellow", "FFFF00",}, {"frosted", "Frosted", "FFFFFF",}
}

for i in ipairs(glass_list) do
	local name = glass_list[i][1]
	local description = glass_list[i][2]
	local colour = glass_list[i][3]

	minetest.register_node("abriglass:stained_glass_"..name, {
		description = description.." Glass",
		tiles = {"abriglass_plainglass.png^[colorize:#"..colour..":122"},
		groups = {cracky = 3},
		use_texture_alpha = true,
		sunlight_propagates = true,
		light_source = 4,
		drawtype = "glasslike",
		paramtype = "light",
		sounds = default.node_sound_glass_defaults(),
	})
end


-- boring glass because why not?
minetest.register_node("abriglass:clear_glass", {
	description = "Clear Glass",
	tiles = {"abriglass_clearglass.png"},
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	paramtype = "light",
	drawtype = "glasslike",
	sounds = default.node_sound_glass_defaults(),
})


-- glass lights
local light_list = {
	{"glass_light_green", "Green", "lightgreen",},
	{"glass_light_blue", "Blue", "lightblue",},
	{"glass_light_red", "Red", "lightred",},
	{"glass_light_yellow", "Yellow", "lightyellow",},
}

for i in ipairs(light_list) do
	local name = light_list[i][1]
	local description = light_list[i][2]
	local image = light_list[i][3]

	minetest.register_node("abriglass:" ..name, {
		description = description.. "Glass Light",
		tiles = {"abriglass_" ..image.. ".png"},
		groups = {cracky = 3},
		use_texture_alpha = true,
		sunlight_propagates = true,
		light_source = 14,
		drawtype = "glasslike",
		paramtype = "light",
		sounds = default.node_sound_glass_defaults(),
	})
end


-- patterned glass
local pattern_list = {   --{name, description, image}
	{"stainedglass_tiles_dark", "Stained Glass", "stainedglass_tiles1",},
	{"stainedglass_tiles_pale", "Stained Glass", "stainedglass_tiles2",},
	{"stainedglass_pattern01", "Stained Glass", "stainedglass_pattern01",},
	{"stainedglass_pattern02", "Cage Glass", "stainedglass_pattern02",},
	{"stainedglass_pattern03", "Stained Glass", "stainedglass_pattern03",},
	{"stainedglass_pattern04", "Stained Glass Cross", "stainedglass_pattern04",},
	{"stainedglass_pattern05", "Stained Glass", "stainedglass_pattern05",},
}

for i in ipairs(pattern_list) do
	local name = pattern_list[i][1]
	local description = pattern_list[i][2]
	local image = pattern_list[i][3]

	minetest.register_node("abriglass:"..name, {
		description = description,
		tiles = {"abriglass_"..image..".png"},
		groups = {cracky = 3},
		use_texture_alpha = true,
		sunlight_propagates = true,
		light_source = 5,
		drawtype = "glasslike",
		paramtype = "light",
		paramtype2 = "facedir",
		sounds = default.node_sound_glass_defaults(),
	})
end


-- portholes
local port_list = {
	{"wood",}, {"junglewood",},
}

for i in ipairs(port_list) do
	local name = port_list[i][1]

	minetest.register_node("abriglass:porthole_"..name, {
		description = "Porthole",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		groups = {choppy = 2, flammable = 2, wood = 1},
		tiles = {"default_"..name.. ".png", -- up
				 "default_"..name.. ".png", -- down
				 "default_"..name.. ".png", -- right
				 "default_"..name.. ".png", -- left
				 "abriglass_porthole_"..name..".png", -- back
				 "abriglass_porthole_"..name..".png", -- front
				 }, 
		is_ground_content = false,
		sunlight_propagates = true,
	})
end


-- one-way one side glass
local oneway_list = {
	{"dark", "Dark", "oneway_face.png", "abriglass_oneway_wall.png", "abriglass_oneway_wall.png",},
	{"pale", "White", "oneway_face.png^[colorize:#F8F8FF:200", "abriglass_oneway_wall.png^[colorize:#E6E6FA:200", "abriglass_oneway_wall.png^[colorize:#E6E6FA:200",},
	{"desert_brick", "Desert Brick", "oneway_face.png^[colorize:#814F3C:200", "default_desert_stone_brick.png", "default_desert_stone_brick.png",},
	{"stone_brick", "Stone Brick", "oneway_face.png^[colorize:#615E5D:200", "default_stone_brick.png", "default_stone_brick.png",},
	{"sandstone_brick", "Sandstone Brick", "oneway_face.png^[colorize:#FFF9C5:200", "default_sandstone_brick.png", "default_sandstone_brick.png",},
	{"desertstone", "Desert Stone", "oneway_face.png^[colorize:#814F3C:200", "default_desert_stone.png", "default_desert_stone.png",},
	{"stone", "Stone", "oneway_face.png^[colorize:#615E5D:200", "default_stone.png", "default_stone.png",},
	{"sandstone", "Sandstone", "oneway_face.png^[colorize:#FFF9C5:200", "default_sandstone.png","default_sandstone.png", },
	{"snow", "Snow", "oneway_face.png^[colorize:#B6B7C1:200", "default_snow.png","default_snow.png", },
    	{"dirt", "Dirt", "oneway_face.png^[colorize:#4C341F:200", "default_dirt.png","default_dirt.png", },
    	{"dirt_grass", "Dirt with Grass", "oneway_face.png^[colorize:#30470E:200", "default_grass.png","default_dirt.png^default_grass_side.png", },
    	{"dirt_snow", "Dirt with Snow", "oneway_face.png^[colorize:#B6B7C1:200", "default_snow.png","default_dirt.png^default_snow_side.png", },
	{"desert_sandstone_brick", "Desert Sandstone Brick", "oneway_face.png^[colorize:#C5C18F:200", "default_desert_sandstone_brick.png","default_desert_sandstone_brick.png", },
	{"silver_sandstone_brick", "Silver Sandstone Brick", "oneway_face.png^[colorize:#C3C0B5:200", "default_silver_sandstone_brick.png","default_silver_sandstone_brick.png", },
	{"obsidian_brick", "Obsidian Brick", "oneway_face.png^[colorize:#131518:200", "default_obsidian_brick.png","default_obsidian_brick.png", },
}

if minetest.get_modpath("ethereal") then
	table.insert(oneway_list, {"snowbrick", "Snow Brick", "oneway_face.png^[colorize:#EEEFFF:200", "ethereal_brick_snow.png", "ethereal_brick_snow.png", })
	table.insert(oneway_list, {"icebrick", "Ice Brick", "oneway_face.png^[colorize:#A9BED9:200", "ethereal_brick_ice.png", "ethereal_brick_ice.png", })
end

for i in ipairs(oneway_list) do
	local name = oneway_list[i][1]
	local description = oneway_list[i][2]
	local image1 = oneway_list[i][3]
	local image2 = oneway_list[i][4]
	local image3 = oneway_list[i][5]

	minetest.register_node("abriglass:oneway_glass_one_"..name, {
		description = description.." One-Way Glass One Side",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		groups = {cracky = 3},
		tiles = {"abriglass_oneway_plain_glass.png", -- up
				 "abriglass_oneway_plain_glass.png", -- down
				 "abriglass_oneway_plain_glass.png", -- right
				 "abriglass_oneway_plain_glass.png", -- left
				 "abriglass_"..image1, -- back
				 image2, -- front
				 }, 
		is_ground_content = false,
		sunlight_propagates = true,
		inventory_image = minetest.inventorycube("abriglass_"..image1)
	})
end


-- one-way two sides glass

for i in ipairs(oneway_list) do
	local name = oneway_list[i][1]
	local description = oneway_list[i][2]
	local image1 = oneway_list[i][3]
	local image2 = oneway_list[i][4]
	local image3 = oneway_list[i][5]
        
	minetest.register_node("abriglass:oneway_glass_two_"..name, {
		description = description.." One-Way Glass Two Sides",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		groups = {cracky = 3},
		tiles = {image2, -- up
				 "abriglass_"..image1, -- down
				 "abriglass_oneway_plain_glass.png", -- right
				 "abriglass_oneway_plain_glass.png", -- left
				 "abriglass_"..image1, -- back
				 image3, -- front
				 }, 
		is_ground_content = false,
		sunlight_propagates = true,
		inventory_image = minetest.inventorycube("abriglass_"..image1)
	})
end


-- one-way three sides glass

for i in ipairs(oneway_list) do
	local name = oneway_list[i][1]
	local description = oneway_list[i][2]
	local image1 = oneway_list[i][3]
	local image2 = oneway_list[i][4]
	local image3 = oneway_list[i][5]
        
	minetest.register_node("abriglass:oneway_glass_three_"..name, {
		description = description.." One-Way Glass Three Sides",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			},
		},
		groups = {cracky = 3},
		tiles = {image2, -- up
				 "abriglass_"..image1, -- down
				 image3, -- right
				 "abriglass_"..image1, -- left
				 "abriglass_"..image1, -- back
				 image3, -- front
				 }, 
		is_ground_content = false,
		sunlight_propagates = true,
		inventory_image = minetest.inventorycube("abriglass_"..image1)
	})
end

-- normal nodes to match one-way glass
minetest.register_node("abriglass:oneway_wall_dark", {
	description = "Dark Block",
	tiles = {"abriglass_oneway_wall.png"},
	groups = {cracky = 3},
	paramtype2 = "facedir",
})

minetest.register_node("abriglass:oneway_wall_pale", {
	description = "Pale Block",
	tiles = {"abriglass_oneway_wall.png^[colorize:#E6E6FA:200"},
	groups = {cracky = 3},
	paramtype2 = "facedir",
})


-- crystal, for later use in crafting recipes
minetest.register_node("abriglass:ghost_crystal", {
	description = "Ghost Crystal",
	tiles = {"abriglass_ghost_crystal.png"},
	wield_image = "abriglass_ghost_crystal_wield.png",
	groups = {cracky = 3},
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 14,
	drawtype = "glasslike",
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})


-- hidden light node
minetest.register_node("abriglass:hidden_light", {
	description = "Hidden Light",
	tiles = {"abriglass_oneway_plain_glass.png"}, 
	groups = {cracky = 3, not_in_creative_inventory=1},
	use_texture_alpha = true,
	sunlight_propagates = true,
	walkable = false,
	light_source = 7,
	drawtype = "glasslike",
	paramtype = "light",
})
