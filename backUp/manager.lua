Manager = {}

--[[
TODAS AS CALLBACKS
love.directorydropped
love.draw*
love.errhand
love.filedropped
love.focus
love.keypressed*
love.keyreleased*
love.load*
love.lowmemory
love.mousefocus
love.mousemoved*
love.mousepressed*
love.mousereleased*
love.quit
love.resize
love.run
love.textedited
love.textinput
love.threaderror
love.touchmoved
love.touchpressed
love.touchreleased
love.update*
love.visible
love.wheelmoved
]]--

local models = {}

local update = {}
local draw = {}
local keypressed = {}

local BASE = (...):match('(.-)[^%.]+$')
--require(BASE .. "functionManager")

--Functions Manager
function Manager:add(model) -- Add
	if #models > 0 then
		if not exist(model, models) then
			model:load()
			table.insert(models, model)
			split(model)
		end
	else
		model:load()
		table.insert(models, model)
		split(model)
	end
end

function Manager:remove(model)
	for i=1,#models do
		if models[i] == model then
			table.remove(models, i)
			break
		end
	end

	for i=1,#update do
		if update[i] == model then
			table.remove(update, i)
			break
		end
	end

	for i=1,#draw do
		if draw[i][1] == model then
			table.remove(draw, i)
			break
		end
	end

	for i=1,#keypressed do
		if keypressed[i] == model then
			table.remove(keypressed, i)
			break
		end
	end
end

function Manager:pauseUpdate(model) -- Pause Update
	for i=1,#update do
		if update[i] == model then
			table.remove(update, i)
			break
		end
	end
end
function Manager:resumeUpdate(model) -- Pause Update
	if not exist(model, update) then	
		table.insert(update, model)
	end
end

function Manager:pauseDraw(model) -- Pause Draw
	for i=1,#draw do
		if draw[i][1] == model then
			draw[i][2] = false
		end
	end
end
function Manager:resumeDraw(model) -- Pause Draw
	for i=1,#draw do
		if draw[i][1] == model then
			draw[i][2] = true
		end
	end
end

function Manager:swapDraw(model1, model2) -- Troca a ordem de impressão
	local positionModel1 = position(model1, draw)
	local positionModel2 = position(model2, draw)

	if positionModel1 > 0 and positionModel2 > 0 then
		local auxData = draw[positionModel1]
		draw[positionModel1] = draw[positionModel2]
		draw[positionModel2] = auxData
	end
end

-- Callbacks functions
function Manager:update(dt)
	for i=1,#update do
		update[i]:update(dt)
	end
end

function Manager:draw()
	for i=1,#draw do
		if draw[i][2] then
			draw[i][1]:draw()
		end
	end
end

function Manager:keypressed(key, unicode)
	for i=1,#keypressed do
		keyoressed[i]:keypressed(key, unicode)
	end
end

-- Funções
function split(model)
	if model.update then
		table.insert(update, model)
	end
	if model.draw then
		table.insert(draw, {model, true})
	end
	if model.keypressed then
		table.insert(keypressed, model)
	end
end

function exist(model, tableSearch) -- Existencia do modulo
	for i=1,#tableSearch do
		if model == tableSearch[i] then
			return true
		end
	end
	return false
end

function position(model) -- Posilçao de impressão do modulo
	for i=1,#models do
		if model == models[i] then
			return i
		end
	end
	return -1
end