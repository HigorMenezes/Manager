require("player")
require("circle")
require("manager")

function love.load()
	Manager:add(Player)
	Manager:add(Circle)
end

function love.update(dt)
	Manager:update(dt)
end

function love.draw()
	Manager:draw()
end

function love.keypressed(key, unicode)
	Manager:keypressed(key, unicode)
	if key == "p" then
		Manager:pauseUpdate(Player)
	end
	if key == "o" then
		Manager:resumeUpdate(Player)
	end
	if key == "i" then
		Manager:pauseDraw(Player)
	end
	if key == "u" then
		Manager:resumeDraw(Player)
	end
	if key == "l" then
		Manager:swapDraw(Player, Circle)
	end
	if key == "k" then
		Manager:remove(Player)
	end
	if key == "j" then
		Manager:add(Player)
	end
end

function love.mousepressed(x, y, button, istouch)
	Manager:mousepressed(x, y, button, istouch)
end

function love.mousemoved(x, y, dx, dy, istouch)
	Manager:mousemoved(x, y, dx, dy, istouch)
end

function love.wheelmoved(x, y)
	Manager:wheelmoved(x, y)
end

function love.keyreleased(key, scancode)
	Manager:keyreleased(key, scancode)
end

function love.mousereleased(x, y, button)
	Manager:mousereleased(x, y, button)
end