
local Tilemap = require "core.Tilemap"
local Picker = require "game.Picker"

function love.load(arg)
  love.keyboard.setKeyRepeat(0.1, 0.5)
  mapData = require "res.TestMap"
  map = Tilemap:new(32, 32, 100, 100, mapData)


  picker = Picker:new(map)
end

function love.update(dt)
  picker:update(dt)
end

function love.draw()
  map:draw()
  picker:draw()
end

function love.keypressed(key, scancode, isrepeat)
  picker:keypressed(key, scancode, isrepeat)
  if key == "q" then
    love.event.quit()
  end
end
