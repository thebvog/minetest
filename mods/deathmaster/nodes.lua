-- Grave
minetest.register_node("deathmaster:grave", {
    description = "Grave",
	tiles = {
		"deathmaster_grave_top.png",
		"deathmaster_grave_bottom.png",
		"deathmaster_grave.png",
	},
	groups = {falling_node=1, cracky=3},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
        fixed = {
			{-0.3125, -0.50, -0.3125, 0.3125, -0.3125, 0.3125},
			{-0.1875, -0.3125, -0.1875, 0.1875, 0.125, 0.1875},
			{-0.0625, 0.125, -0.0625, 0.0625, 0.5, 0.0625},
			{-0.0625, 0.25, -0.1875, 0.0625, 0.375, 0.1875},
			{-0.1875, 0.25, -0.0625, 0.1875, 0.375, 0.0625},
		}
	},
	selection_box = node_box,
})