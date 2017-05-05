Manager = {}

local BASE = (...):match('(.-)[^%.]+$')
require(BASE .. "auxiliaryFunctions")

local callBack = {
	models = {},
	update = {},
	draw = {},
	keypressed = {},
	mousepressed = {},
	mousemoved = {},
	wheelmoved = {},
	keyreleased = {},
	mousereleased = {},
	touchpressed = {},
	touchreleased = {},
	touchmoved = {}
	--[[MUDA SEMPRE QUE INSERIR ALGO]]--
}

-- Functions Manager -------------------------------------------------------------------------------------------------------
function Manager:add(model) -- Add
	if #callBack.models > 0 then
		if not exist(model, callBack.models) then
			model:load()
			table.insert(callBack.models, model)
			split(model, callBack)
		end
	else
		model:load()
		table.insert(callBack.models, model)
		split(model, callBack)
	end
end

function Manager:remove(model) -- Remove
	remove(model, callBack)
end

function Manager:pauseUpdate(model) -- Pause Update
	for i=1,#callBack.update do
		if callBack.update[i] == model then
			table.remove(callBack.update, i)
			break
		end
	end
end

function Manager:resumeUpdate(model) -- Pause Update
	if not exist(model, callBack.update) and exist(model, callBack.models) then	
		table.insert(callBack.update, model)
	end
end

function Manager:pauseDraw(model) -- Pause Draw
	for i=1,#callBack.draw do
		if callBack.draw[i][1] == model then
			callBack.draw[i][2] = false
		end
	end
end

function Manager:resumeDraw(model) -- Pause Draw
	for i=1,#callBack.draw do
		if callBack.draw[i][1] == model then
			callBack.draw[i][2] = true
		end
	end
end

function Manager:swapDraw(model1, model2) -- Troca a ordem de impressão
	local positionModel1 = position(model1, callBack.draw)
	local positionModel2 = position(model2, callBack.draw)

	if positionModel1 > 0 and positionModel2 > 0 then
		local auxData = callBack.draw[positionModel1]
		callBack.draw[positionModel1] = callBack.draw[positionModel2]
		callBack.draw[positionModel2] = auxData
	end
end
-------------------------------------------------------------------------------------------------------------

-- Callbacks functions --------------------------------------------------------------------------------------
function Manager:update(dt)
	for i=1,#callBack.update do
		callBack.update[i]:update(dt)
	end
end

function Manager:draw()
	for i=1,#callBack.draw do
		if callBack.draw[i][2] then
			callBack.draw[i][1]:draw()
		end
	end
end

function Manager:keypressed(key, unicode)
	for i=1,#callBack.keypressed do
		callBack.keypressed[i]:keypressed(key, unicode)
	end
end

function Manager:mousepressed(x, y, button, istouch)
	for i=1,#callBack.mousepressed do
		callBack.mousepressed[i]:mousepressed(x, y, button, istouch)
	end
end

function Manager:mousemoved(x, y, dx, dy, istouch)
	for i=1,#callBack.mousemoved do
		callBack.mousemoved[i]:mousemoved(x, y, dx, dy, istouch)
	end
end

function Manager:wheelmoved(x, y)
	for i=1,#callBack.wheelmoved do
		callBack.wheelmoved[i]:wheelmoved(x, y)
	end
end

function Manager:keyreleased(key, scancode)
	for i=1,#callBack.keyreleased do
		callBack.keyreleased[i]:keyreleased(key, scancode)
	end
end

function Manager:mousereleased(x, y, button)
	for i=1,#callBack.mousereleased do
		callBack.mousereleased[i]:mousereleased(x, y, button)
	end
end

function Manager:touchpressed(id, x, y, dx, dy, pressure)
	for i=1,#callBack.touchpressed do
		callBack.touchpressed[i]:touchpressed(id, x, y, dx, dy, pressure)
	end
end

function Manager:touchreleased(id, x, y, dx, dy, pressure)
	for i=1,#callBack.touchreleased do
		callBack.touchreleased[i]:touchreleased(id, x, y, dx, dy, pressure)
	end
end

function Manager:touchmoved(id, x, y, dx, dy, pressure)
	for i=1,#callBack.touchmoved do
		callBack.touchmoved[i]:touchmoved(id, x, y, dx, dy, pressure)
	end
end
	--[[Muda sempre que adiciona algo]]--
---------------------------------------------------------------------------------------------------------------
