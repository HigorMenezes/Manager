Player = {}

function Player:load()
	self.x = 10
	self.y = 10
	self.speed = 300
	self.speedY = self.speed * math.cos(math.pi / 4)
	self.speedX = self.speed * math.cos(math.pi / 4)
end

function Player:update(dt)
	if love.keyboard.isDown("w") and love.keyboard.isDown("a") then
    self.y = self.y - self.speedY * dt
    self.x = self.x - self.speedX * dt
    self.r = math.pi*7/4
  elseif love.keyboard.isDown("a") and love.keyboard.isDown("s") then
    self.y = self.y + self.speedY * dt
    self.x = self.x - self.speedX * dt
    self.r = math.pi*5/4
  elseif love.keyboard.isDown("s") and love.keyboard.isDown("d") then
    self.y = self.y + self.speedY * dt
    self.x = self.x + self.speedX * dt
    self.r = math.pi*3/4
  elseif love.keyboard.isDown("d") and love.keyboard.isDown("w") then
    self.y = self.y - self.speedY * dt
    self.x = self.x + self.speedX * dt
    self.r = math.pi*1/4
  elseif love.keyboard.isDown("w") then
    self.y = self.y - self.speed * dt
    self.r = 0
  elseif love.keyboard.isDown("a") then
    self.x = self.x - self.speed * dt
    self.r = math.pi*3/2
  elseif love.keyboard.isDown("s") then
    self.y = self.y + self.speed * dt
    self.r = math.pi
  elseif love.keyboard.isDown("d") then
    self.x = self.x + self.speed * dt
    self.r = math.pi*1/2
  end
end

function Player:draw()
	love.graphics.setColor(255, 255, 255)
    love.graphics.circle("fill", self.x or 10, self.y or 10, 20)
end
