local Tilemap = require "..core.Tilemap"
local Picker = require "..game.Picker"
local Hud = require "..game.ui.hud"
local CropTimer = require "..game.crops.CropTimer"
local globals = require "..globals"
local StateManager = require "..core.StateManager"
local CropManager = require "..game.crops.CropManager"
local Camera = require "..core.lib.hump.camera"
local minZoom, maxZoom = 1, 2
local gameState = {}

function gameState:init()
  map = Tilemap:new(32, 32, 100, 100, mapData)
  cropTick = CropTimer:new()

  cropManager = CropManager:new(map)

  --testCrop = Crop:new("Fisksild", 64, 64, 10, Assets.wheat)
  picker = Picker:new(map, cropManager)
  hud = Hud:new(picker)
  camera = Camera.new(picker:getX(), picker:getY(), minZoom)
  print("Halajuja")

end

function gameState:update(dt)
  picker:update(dt)
  cropManager:update(dt)
  camera:lookAt(picker:getX(), picker:getY())
  cropTick:update(dt)
end

function gameState:draw()
  love.graphics.setColor(rgb(53, 99, 35))
  love.graphics.rectangle("fill", 0, 0, 2000, 2000)
  camera:attach()
  map:draw()
  cropManager:draw()
  picker:draw()
  camera:detach()
  hud:draw()
end

function gameState:keypressed(key, scancode, isrepeat)
  picker:keypressed(key, scancode, isrepeat)
  if key == "q" then
    love.event.quit()
  end

  if key == "z" then
    local zoom = camera.scale
    if zoom == minZoom then
      camera:zoom(maxZoom)
    else
      camera:zoomTo(minZoom)
    end
  end

  if key == "p" then
    cropManager:tick()
  end
end

return gameState
