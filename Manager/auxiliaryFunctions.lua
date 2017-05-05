auxiliaryFunctions = {}

function exist(model, tableSearch) -- Existencia do modulo
	for i=1,#tableSearch do
		if model == tableSearch[i] then
			return true
		end
	end
	return false
end

function position(model, tableSearch) -- Posilçao de impressão do modulo
	for i=1,#tableSearch do
		if model == tableSearch[i][1] then
			return i
		end
	end
	return -1
end

function split(model, callBack)
	if model.update then
		table.insert(callBack.update, model)
	end
	if model.draw then
		table.insert(callBack.draw, {model, true})
	end
	if model.keypressed then
		table.insert(callBack.keypressed, model)
	end
	if model.mousepressed then
		table.insert(callBack.mousepressed, model)
	end
	if model.mousemoved then
		table.insert(callBack.mousemoved, model)
	end
	if model.wheelmoved then
		table.insert(callBack.wheelmoved, model)
	end
	if model.keyreleased then
		table.insert(callBack.keyreleased, model)
	end
	if model.mousereleased then
		table.insert(callBack.mousereleased, model)
	end
	if model.touchpressed then
		table.insert(callBack.touchpressed, model)
	end
	if model.touchreleased then
		table.insert(callBack.touchreleased, model)
	end
	if model.touchmoved then
		table.insert(callBack.touchmoved, model)
	end
	--[[Muda sempre que adiciona algo]]--
end

function remove(model, callBack)
	for i=1,#callBack.models do
		if callBack.models[i] == model then
			table.remove(callBack.models, i)
			break
		end
	end

	for i=1,#callBack.update do
		if callBack.update[i] == model then
			table.remove(callBack.update, i)
			break
		end
	end

	for i=1,#callBack.draw do
		if callBack.draw[i][1] == model then
			table.remove(callBack.draw, i)
			break
		end
	end

	for i=1,#callBack.keypressed do
		if callBack.keypressed[i] == model then
			table.remove(callBack.keypressed, i)
			break
		end
	end

	for i=1,#callBack.mousepressed do
		if callBack.mousepressed[i] == model then
			table.remove(callBack.mousepressed, i)
			break
		end
	end

	for i=1,#callBack.mousemoved do
		if callBack.mousemoved[i] == model then
			table.remove(callBack.mousemoved, i)
			break
		end
	end

	for i=1,#callBack.wheelmoved do
		if callBack.wheelmoved[i] == model then
			table.remove(callBack.wheelmoved, i)
			break
		end
	end

	for i=1,#callBack.keyreleased do
		if callBack.keyreleased[i] == model then
			table.remove(callBack.keyreleased, i)
			break
		end
	end

	for i=1,#callBack.mousereleased do
		if callBack.mousereleased[i] == model then
			table.remove(callBack.mousereleased, i)
			break
		end
	end

	for i=1,#callBack.touchpressed do
		if callBack.touchpressed[i] == model then
			table.remove(callBack.touchpressed, i)
			break
		end
	end

	for i=1,#callBack.touchreleased do
		if callBack.touchreleased[i] == model then
			table.remove(callBack.touchreleased, i)
			break
		end
	end

	for i=1,#callBack.touchmoved do
		if callBack.touchmoved[i] == model then
			table.remove(callBack.touchmoved, i)
			break
		end
	end
	--[[Muda sempre que adiciona algo]]--
end


--[[
ALL CALLBACKS
love.directorydropped
love.draw* --
love.errhand
love.filedropped
love.focus
love.keypressed* --
love.keyreleased* --
love.load* --
love.lowmemory
love.mousefocus
love.mousemoved* -- 
love.mousepressed* --
love.mousereleased* -- 
love.quit
love.resize
love.run
love.textedited
love.textinput
love.threaderror
love.touchmoved* --
love.touchpressed* --
love.touchreleased* --
love.update* --
love.visible
love.wheelmoved* --
]]--