
local Tilemap = require "core.Tilemap"
local Picker = require "game.Picker"

function love.load(arg)
  map = Tilemap:new(32, 32, 10, 10, {
    0,0,0,0,0,0,0,0,0,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,0,
    0,0,0,0,0,0,0,0,0,0,
  })
  picker = Picker:new(map)
end

function love.update(dt)
  picker:update(dt)
end

function love.draw()
  map:draw()
  picker:draw()
end
