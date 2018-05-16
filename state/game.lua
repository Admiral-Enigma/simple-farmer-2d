local Tilemap = require "core.Tilemap"
local Player = require "game.Player"
local Hud = require "game.ui.hud"
local CropTimer = require "game.crops.CropTimer"
local globals = require "globals"
local StateManager = require "core.StateManager"
local CropManager = require "game.crops.CropManager"
local Camera = require "core.lib.hump.camera"
ItemBlueprints = require "game.item.ItemBlueprints"
local gameState = {}

function gameState:init()
  local mapToLoad
  if #saveEngine:getDataStore("map") == 0 then
    mapToLoad = mapData
  else
    mapToLoad = saveEngine:getDataStore("map")[1]
  end
  map = Tilemap:new(32, 32, 100, 100, mapToLoad)
  cropTick = CropTimer:new()

  cropManager = CropManager:new(map)
  cropManager:loadCrops()

  --testCrop = Crop:new("Fisksild", 64, 64, 10, Assets.wheat)
  player = Player:new(map, cropManager)
  hud = Hud:new(player)
  camera = Camera.new(player:getX(), player:getY(), minZoom)
  barn:load()
  --barn:addItem(ItemBlueprints.droemmeKage)

end

function gameState:update(dt)
  player:update(dt)
  cropManager:update(dt)
  camera:lookAt(player:getX(), player:getY())
  cropTick:update(dt)
end

function gameState:draw()
  love.graphics.setColor(rgb(53, 99, 35))
  love.graphics.rectangle("fill", 0, 0, 2000, 2000)
  camera:attach()
  map:draw()
  cropManager:draw()
  player:draw()
  camera:detach()
  hud:draw()
end

function gameState:keypressed(key, scancode, isrepeat)
  player:keypressed(key, scancode, isrepeat)

  if key == "e" then
    StateManager:push("state.barnUI")
  end

  if key == "z" then
    local zoom = camera.scale
    if zoom == globals.zoom.min then
      camera:zoom(globals.zoom.max)
    else
      camera:zoomTo(globals.zoom.min)
    end
  end


  if key == "p" then
    --cropManager:tick()
    --
    cropManager:setCrops()

  end

  if key == "i" then
    saveEngine:saveToDisk(1)
  end


end

return gameState
