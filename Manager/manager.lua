Manager = {}

local BASE = (...):match('(.-)[^%.]+$')
require(BASE .. "functionManager")

--Functions Manager
function Manager:add(data, pauseUpdate, pauseDraw) -- Add
	if #self > 0 then
		if not exist(data, manager) then
			data:load()
			table.insert(self, {data, pauseUpdate or true, pauseDraw or true})
		end
	else
		data:load()
		table.insert(self, {data, pauseUpdate or true, pauseDraw or true})
	end
end

function Manager:pauseAll(data) -- Pausa update e draw
	for i=1,#self do
		if self[i][1] == data then
			if self[i][2] == true and self[i][3] == true then
				self[i][2] = false
				self[i][3] = false
			else
				self[i][2] = true
				self[i][3] = true
			end
		end
	end
end

function Manager:pauseUpdate(data) -- Pause Update
	for i=1,#self do
		if self[i][1] == data then
			if self[i][2] == true then
				self[i][2] = false
			else
				self[i][2] = true
			end
		end
	end
end

function Manager:pauseDraw(data) -- Pause Draw
	for i=1,#self do
		if self[i][1] == data then
			if self[i][3] == true then
				self[i][3] = false
			else
				self[i][3] = true
			end
		end
	end
end

function Manager:remove(data) -- Remove 
	for i=1,#self do
		if data == self[i][1] then
			table.remove(self, i)
		end
	end
end

function Manager:swap(data1, data2) -- Troca a ordem de impressão
	local positionData1 = position(data1, manager)
	local positionData2 = position(data2, manager)

	if positionData1 > 0 and positionData2 > 0 then
		local auxData = self[positionData1]
		self[positionData1] = self[positionData2]
		self[positionData2] = auxData
	end
end

-- Callbacks functions
function Manager:update(dt)
	for i=1,#self do
		if self[i][2] and self[i][1].update then
			self[i][1]:update(dt)
		end
	end
end

function Manager:draw()
	for i=1,#self do
		if self[i][3] and self[i][1].draw then
			self[i][1]:draw()
		end
	end
end

function Manager:keypressed(key, unicode)
	for i=1,#self do
		if self[i][2] and self[i][1].keypressed then
			self[i][1]:keypressed(key, unicode)
		end
	end
end
