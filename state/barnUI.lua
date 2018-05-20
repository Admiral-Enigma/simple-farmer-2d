local StateManager = require "core.StateManager"
local Panel = require "game.ui.gui.Panel"
local Textbox = require "game.ui.gui.Textbox"

local barnState = {}
local items = barn:getItems()
local index = 1
local infoPanel = nil
local mainPanel = nil
local hasItemChanged

function barnState:init ()
  hasItemChanged = true
  local windowSizeWidth, windowSizeHeight = love.graphics.getDimensions( )

  -- Main panel
  local barnW, barnH = 400, 300
  local barnX, barnY = windowSizeWidth / 2 - barnW / 2, windowSizeHeight / 2 - barnH / 2

--  love.graphics.setColor(rgba(24,20,37, 200))
--  love.graphics.rectangle("fill", barnX, barnY, barnW, barnH)
  mainPanel = Panel:new(barnX, barnY, barnW, barnH)

  --Info panel
  local infoW, infoH = 200, 300
  local infoX, infoY = barnX - infoW - 5, barnY
  --love.graphics.setColor(rgba(24,20,37, 200))
  --love.graphics.rectangle("fill", infoX, infoY, infoW, infoH)

  infoPanel = Textbox:new(infoX, infoY, infoW, infoH)

end

function barnState:keypressed(key, scancode, isrepeat)
  if key == "e" then
    StateManager:pop()
  elseif key == "s" then
    index = math.min(index + 1, #items)
    hasItemChanged = true
    infoPanel:clearLines()

  elseif key == "w" then
    index = math.max(1, index - 1)
    infoPanel:clearLines()
    hasItemChanged = true
  end
end

function barnState:draw()
  local stateBelow = StateManager:get(-1)
  stateBelow:draw()
  local selectedItem = nil


  mainPanel:draw()

  love.graphics.setColor(rgb(255,255,255))
  love.graphics.print("Items", mainPanel.x + 10, mainPanel.y + 5)
  local itemX, itemY = mainPanel.x + 10, mainPanel.y + 30
  local itemWidth, itemHeight = mainPanel.width - 20, 32

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


  love.graphics.setColor(rgb(255,255,255))
  local lastItem = nil
  if selectedItem ~= nil then
    if hasItemChanged then
      infoPanel:addLine(10, 5, selectedItem.name, false)
      infoPanel:addLine(10, 25, selectedItem.description, true)
      infoPanel:addLine(10, 45, "Price: "..selectedItem.price, false)
      hasItemChanged = false
    end

--    love.graphics.print(selectedItem.name, infoX + 10, infoY + 5)
--    love.graphics.printf(selectedItem.description, infoX + 10, infoY + 25, infoW - 10)
--    love.graphics.print("Price: "..selectedItem.price, infoX + 10, infoY + 45)
  end
  infoPanel:draw()



end

return barnState
