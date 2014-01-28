--
-- Deaths
--

function deathmaster.last_death(name, param)
	local player = minetest.get_player_by_name(name)
	if not player then
		return
	end
	if deathmaster.deaths[name] == nil then
		minetest.chat_send_player(name, "You weren't died in this server session", false)
		return
	end
	local pos = deathmaster.deaths[name]
	minetest.chat_send_player(name, string.format("Last death: %s", minetest.pos_to_string(pos)), false)
end

function deathmaster.deaths_stats(name, param)
	local player = minetest.get_player_by_name(name)
	if not player then
		return
	end
	if deathmaster.deaths[name] == nil then
		minetest.chat_send_player(name, "You weren't died in this server session", false)
		return
	end
	minetest.chat_send_player(name, string.format("Your deaths: %d", deathmaster.player_death_counter[name]), false)
	minetest.chat_send_player(name, string.format("All deaths: %d", deathmaster.all_death_counter), false)
end

function deathmaster.on_dieplayer_handler(player)
	deathmaster.deaths[player:get_player_name()] = player:getpos()
	deathmaster.all_death_counter = deathmaster.all_death_counter + 1
	if deathmaster.player_death_counter[player:get_player_name()] ~= nil then
		deathmaster.player_death_counter[player:get_player_name()] = deathmaster.player_death_counter[player:get_player_name()] + 1
	else
		deathmaster.player_death_counter[player:get_player_name()] = 1
	end
	minetest.chat_send_player(player:get_player_name(), string.format("It's your %d death.", deathmaster.player_death_counter[player:get_player_name()]), false)
	if deathmaster.need_graves then
		pos = player:getpos()
		pos.y = pos.y + 1
		minetest.set_node(pos, {name="deathmaster:grave"})
	end
	return true
end

function deathmaster.graves_on(name, param)
	local player = minetest.get_player_by_name(name)
	if not player then
		return
	end
	privs = minetest.get_player_privs(name)
	if privs.graves then
		deathmaster.need_graves = true
		minetest.chat_send_all("Graves on")
	else
		minetest.chat_send_player(name, "You don't have privileges.", false)
	end
	return true
end

function deathmaster.graves_off(name, param)
	local player = minetest.get_player_by_name(name)
	if not player then
		return
	end
	privs = minetest.get_player_privs(name)
	if privs.graves then
		deathmaster.need_graves = false
		minetest.chat_send_all("Graves off")
	else
		minetest.chat_send_player(name, "You don't have privileges.", false)
	end
	return true
end