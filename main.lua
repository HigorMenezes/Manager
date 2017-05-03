require("player")
require("manager")
require("circle")
require("Manager")
--init.lua -- PARA DAR REQUIRE NA PASTA
--assent -- PARA MOSTRAR O ERRO

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