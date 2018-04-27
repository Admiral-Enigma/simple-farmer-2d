
local Tilemap = require "core.Tilemap"
local Picker = require "game.Picker"
Camera = require "core.lib.hump.camera"

function love.load(arg)
  love.keyboard.setKeyRepeat(0.1, 0.5)
  mapData = require "res.TestMap"
  map = Tilemap:new(32, 32, 100, 100, mapData)
  picker = Picker:new(map)

  camera = Camera.new(picker:getX(), picker:getY(), 1)

end

function love.update(dt)
  picker:update(dt)
  camera:lookAt(picker:getX(), picker:getY())
end

function love.draw()
  camera:attach()
  map:draw()
  picker:draw()
  camera:detach()
end

function love.keypressed(key, scancode, isrepeat)
  picker:keypressed(key, scancode, isrepeat)
  if key == "q" then
    love.event.quit()
  end
end
