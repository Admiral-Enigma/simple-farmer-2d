local StateManager = require "core.StateManager"

local barnState = {}
local items = barn:getItems()
local index = 1

function barnState:init ()
  -- body...
end

function barnState:keypressed(key, scancode, isrepeat)
  if key == "return" then
    StateManager:pop()
  elseif key == "down" then
    index = math.min(index + 1, #items)
  elseif key == "up" then
    index = math.max(1, index - 1)
  end
end

function barnState:draw()
  local stateBelow = StateManager:get(-1)
  stateBelow:draw()

  local windowX, windowY = 150, 150
  local windowW, windowH = 400, 300
  love.graphics.setColor(rgb(115,62,57))
  love.graphics.rectangle("fill", windowX, windowY, windowW, windowH)

  love.graphics.setColor(rgb(0,0,0))
  local itemX, itemY = windowX + 10, windowY + 10
  local itemWidth, itemHeight = windowW - 20, 32

  for i, item in ipairs(items) do
    if i == index then
      love.graphics.setColor(rgb(255,255,255))
    else
      love.graphics.setColor(rgb(127,127,127))
    end
    love.graphics.rectangle("fill", itemX, itemY, itemWidth, itemHeight)
    love.graphics.setColor(rgb(0,0,0))
    love.graphics.print(item.name, itemX+ 5, itemY + 5)
    itemY = itemY + itemHeight + 8
  end
end

return barnState
