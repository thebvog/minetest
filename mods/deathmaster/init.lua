--[[
DeathMaster mod by thebvog.
thebvog@gmail.com
1/22/2014
]]--

-- Definitions made by this mod that other mods can use too
deathmaster = {}

-- Load files
dofile(minetest.get_modpath("deathmaster").."/functions.lua")
dofile(minetest.get_modpath("deathmaster").."/nodes.lua")
dofile(minetest.get_modpath("deathmaster").."/crafting.lua")

-- Init events and data
deathmaster.need_graves = false
deathmaster.deaths = {}
deathmaster.player_death_counter = {}
deathmaster.all_death_counter = 0
minetest.register_on_dieplayer(deathmaster.on_dieplayer_handler)

minetest.register_chatcommand("lastdeath", {
	params = "<lastdeath>",
	description = "Last position where you were died",
	func = deathmaster.last_death,
})

minetest.register_chatcommand("deathstats", {
	params = "<deathstats>",
	description = "Deaths statistic",
	func = deathmaster.deaths_stats,
})

minetest.register_chatcommand("graveson", {
	params = "<graveson>",
	description = "Turn on graves after death",
	func = deathmaster.graves_on,
})

minetest.register_chatcommand("gravesoff", {
	params = "<gravesoff>",
	description = "Turn off graves after death",
	func = deathmaster.graves_off,
})

minetest.register_privilege("graves", {
	description = "Player can turn on and turn off graves.",
	give_to_singleplayer = true,
})