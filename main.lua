local StateManager = require "core.StateManager"
Color = require "utils.Color"
Signal = require 'core.lib.hump.signal'
Timer = require "core.lib.hump.timer"
local SaveEngine = require "core.SaveEngine"
local Crop = require "game.crops.Crop"

function love.load()
  love.keyboard.setKeyRepeat(true)
  love.graphics.setDefaultFilter("nearest", "nearest")
  Assets = require "asset"
  mapData = require "res.TestMap"
  saveEngine = SaveEngine:new()
  saveEngine:createDataStore("crops")
  saveEngine:createDataStore("map")
  saveEngine:loadData()
  --local testCrop = Crop:new("Fisk", 32, 32, 4, 6, 10, Assets.wheat)
  --local encodedCrop = saveEngine:encode(testCrop:serialize())
  --print(encodedCrop)
  --local decodedCrop = saveEngine:decode(encodedCrop)
  --print(decodedCrop)

  StateManager:push("state.game")
end

function love.keypressed(key, scancode, isrepeat)
  StateManager:tryInvoke("keypressed", key, scancode, isrepeat)
end

function love.update(dt)
  require("core.lib.lovebird").update()
  StateManager:tryInvoke("update", dt)
end

function love.draw()
  StateManager:tryInvoke("draw")
end
