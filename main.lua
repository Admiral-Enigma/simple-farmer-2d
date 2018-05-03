local StateManager = require "core.StateManager"
Color = require "utils.Color"
Signal = require 'core.lib.hump.signal'
Timer = require "core.lib.hump.timer"

function love.load()
  love.keyboard.setKeyRepeat(true)
  love.graphics.setDefaultFilter("nearest", "nearest")
  mapData = require "res.TestMap"

  Assets = require "asset"
  StateManager:push("state.game")
end

function love.keypressed(key, scancode, isrepeat)
  StateManager:tryInvoke("keypressed", key, scancode, isrepeat)
end

function love.update(dt)
  StateManager:tryInvoke("update", dt)
end

function love.draw()
  StateManager:tryInvoke("draw")
end
