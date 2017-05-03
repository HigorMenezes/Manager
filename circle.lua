Circle = {}

function Circle:load()
	self.x = 300
	self.y = 300
	self.r = 50
end

function Circle:update(dt)
end

function Circle:draw()
	love.graphics.setColor(170, 170, 170)
    love.graphics.circle("fill", self.x, self.y, self.r)
end

function Circle:keypressed(key, unicode)
end