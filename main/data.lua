local M = {}

M.STATE_MENU = 1
M.STATE_CONTROLS = 2
M.STATE_GETREADY = 3
M.STATE_PLAYING = 4
M.STATE_LEVELCLEAR = 5
M.STATE_GAMEOVER = 6

M.state = M.STATE_MENU

M.TILE_SIZE = 16
M.PIXEL_SIZE = 4
M.STARTING_LEVEL = 1
M.MAX_LEVELS = 5
M.STARTING_SPEED = 15
M.SPEED_INCREMENT = 1
M.SECTION_SPEED_MULTIPLIER = 25
M.TUNNEL_SPEED_MULTIPLIER = 1.5

M.STATE_WAIT = 0
M.STATE_PLAY = 1

M.LEVEL_SECTIONS = {
	{"easy1","easy2","easy3","easy4"},
	{"easy5","easy6","easy7","easy8","easy9","easy10","easy11","easy12","easy13"},
	{"easy5","easy6","easy7","easy8","easy9","easy10","easy11","easy12","easy13","normal1","normal2","normal3","normal4","normal5","normal6"},
	{"easy13","normal1","normal2","normal3","normal4","normal5","normal6","normal7","hard1","hard2","hard3","hard4","hard5","hard6","hard7"},
	{"easy1","easy2","easy3","easy4","easy5","easy6","easy7","easy8","easy9","easy10","easy11","easy12","easy13","normal1","normal2","normal3","normal4","normal5","normal6","normal7","hard1","hard2","hard3","hard4","hard5","hard6","hard7"},
}

M.LEVEL_DURATION = {15, 75, 195, 300, 360, 420, 480, 540, 600}

M.level = M.STARTING_LEVEL
M.score = 0
M.best_score = 0
M.speed = M.STARTING_SPEED
M.distance = 0
M.sections = {0, 0, 0}
M.state = M.STATE_WAIT
M.time_elapsed = 0

M.offset = vmath.vector3(1280/(M.PIXEL_SIZE * 2), 720/(M.PIXEL_SIZE * 2), 0)
M.scrollpos = vmath.vector3(0,0,0)

function M.updateScore(score)
	M.score = M.score + math.floor(score)
end

function M.getScore()
	return M.score
end

function M.startGame()
	M.level = M.STARTING_LEVEL
	M.score = 0
	M.time_elapsed = 0
	M.speed = M.STARTING_SPEED
	M.sections = {'', '', ''}
	M.distance = 0
	M.state = M.STATE_WAIT
end

function M.update_time_elapsed(time)
	M.time_elapsed = M.time_elapsed + time
	return M.time_elapsed
end

function M.reset_level_duration()
	M.time_elapsed = M.time_elapsed - M.get_level_duration()
end

function M.get_level_duration()
	return M.LEVEL_DURATION[M.level]
end

function M.next_level()
	if M.level < M.MAX_LEVELS then
		M.level = M.level + 1
		M.speed = M.speed + M.SPEED_INCREMENT
	end
	
	return M.level
end

function M.get_state()
	return M.state
end

function M.set_state(state)
	M.state = state
end

function M.world2tile(p)
	return vmath.vector3(math.floor((p.x + M.TILE_SIZE) / M.TILE_SIZE), math.floor((p.y + M.TILE_SIZE) / M.TILE_SIZE), p.z)
end

function M.tile2world(p)
	return vmath.vector3((p.x * M.TILE_SIZE) - (M.TILE_SIZE / 2), (p.y * M.TILE_SIZE) - (M.TILE_SIZE / 2), p.z)
end

function M.hex2rgba(hex)
	hex = hex:gsub("#","")
	local rgba = vmath.vector4(tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255, 1)
	return rgba
end

function M.onscreen(p, m)
	local x = p.x - M.scrollpos.x
	if x > -m and x < 320 + m then
		return true
	else
		return false
	end
end

return M