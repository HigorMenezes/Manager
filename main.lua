require("player")
require("circle")
require("manager")
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

function love.keypressed(key, unicode)
    Manager:keypressed(key, unicode)

    if key == "p" then
        Manager:pauseAll(Player)
    end
    if key == "o" then
        Manager:pauseUpdate(Player)
    end
    if key == "i" then
        Manager:pauseDraw(Player)
    end
    if key == "u" then
        Manager:remove(Player)
    end
    if key == "y" then
        Manager:add(Player)
    end
    if key == "l" then
        Manager:swap(Player, Circle)
    end
end