local Tilemap = require "core.Tilemap"
local Picker = require "game.Picker"
local Hud = require "game.ui.hud"
Camera = require "core.lib.hump.camera"


function love.load(arg)
  love.keyboard.setKeyRepeat(true)
  love.graphics.setDefaultFilter("nearest", "nearest")


  mapData = require "res.TestMap"
  map = Tilemap:new(32, 32, 100, 100, mapData)
  picker = Picker:new(map)
  hud = Hud:new(picker)
  camera = Camera.new(picker:getX(), picker:getY(), 1)

end

function love.update(dt)
  picker:update(dt)
  camera:lookAt(picker:getX(), picker:getY())
end

function love.draw()
  love.graphics.setColor(53,99,35)
  love.graphics.rectangle("fill", 0, 0, 800, 600)
  camera:attach()
  map:draw()
  picker:draw()
  camera:detach()
  hud:draw()

end

function love.keypressed(key, scancode, isrepeat)
  picker:keypressed(key, scancode, isrepeat)
  if key == "q" then
    love.event.quit()
  end
end
