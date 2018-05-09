local StateManager = require "core.StateManager"

local barnState = {}
local items = barn:getItems()
local index = 1

function barnState:init ()
  -- body...
end

function barnState:keypressed(key, scancode, isrepeat)
  if key == "e" then
    StateManager:pop()
  elseif key == "s" then
    index = math.min(index + 1, #items)
  elseif key == "w" then
    index = math.max(1, index - 1)
  end
end

function barnState:draw()
  local stateBelow = StateManager:get(-1)
  stateBelow:draw()
  local selectedItem = {}
  local windowSizeWidth, windowSizeHeight = love.graphics.getDimensions( )

  -- Main panel
  local barnW, barnH = 400, 300
  local barnX, barnY = windowSizeWidth / 2 - barnW / 2, windowSizeHeight / 2 - barnH / 2
  love.graphics.setColor(rgb(115,62,57))
  love.graphics.rectangle("fill", barnX, barnY, barnW, barnH)
  love.graphics.setColor(rgb(255,255,255))
  love.graphics.print("Items", barnX + 10, barnY + 5)
  local itemX, itemY = barnX + 10, barnY + 30
  local itemWidth, itemHeight = barnW - 20, 32

  for i, item in ipairs(items) do
    if i == index then
      love.graphics.setColor(rgb(255,255,255))
      selectedItem = item
    else
      love.graphics.setColor(rgb(127,127,127))
    end
    love.graphics.rectangle("fill", itemX, itemY, itemWidth, itemHeight)
    love.graphics.setColor(rgb(0,0,0))
    love.graphics.print(item.name.." x"..item.amount, itemX+ 5, itemY + 5)
    itemY = itemY + itemHeight + 8
  end

  --Info panel
  local infoW, infoH = 200, 300
  local infoX, infoY = barnX - infoW - 5, barnY
  love.graphics.setColor(rgb(115,62,57))
  love.graphics.rectangle("fill", infoX, infoY, infoW, infoH)
  love.graphics.setColor(rgb(255,255,255))
  love.graphics.print(selectedItem.name, infoX + 10, infoY + 5)
  love.graphics.printf(selectedItem.description, infoX + 10, infoY + 25, infoW - 10)
  love.graphics.print("Price: "..selectedItem.price, infoX + 10, infoY + 45)






end

return barnState
