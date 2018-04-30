local Tilemap = require "core.Tilemap"
local Picker = require "game.Picker"
local Hud = require "game.ui.hud"
Crop = require "game.crops.Crop"
CropManager = require "game.crops.CropManager"
Scale = require "scale"
Camera = require "core.lib.hump.camera"


function love.load(arg)
  love.keyboard.setKeyRepeat(true)
  love.graphics.setDefaultFilter("nearest", "nearest")
  Assets = require "asset"

  mapData = require "res.TestMap"
  map = Tilemap:new(32, 32, 100, 100, mapData)

  cropManager = CropManager:new(map)

  --testCrop = Crop:new("Fisksild", 64, 64, 10, Assets.wheat)
  picker = Picker:new(map, cropManager)
  hud = Hud:new(picker)
  camera = Camera.new(picker:getX(), picker:getY(), 1)

end

function love.update(dt)
  picker:update(dt)
  cropManager:update(dt)
  camera:lookAt(picker:getX(), picker:getY())
end

function love.draw()
  love.graphics.setColor(53,99,35)
  love.graphics.rectangle("fill", 0, 0, 2000, 2000)
  camera:attach()
  map:draw()
  cropManager:draw()
  picker:draw()
  camera:detach()
  hud:draw()

end

function love.keypressed(key, scancode, isrepeat)
  picker:keypressed(key, scancode, isrepeat)
  if key == "q" then
    love.event.quit()
  end
  if key == "p" then
    --testCrop:tick()
  end
end
