local Hud = {}
Hud.__index = Hud

function Hud:new(picker)
  local ins = setmetatable({}, self)
  ins._picker = picker or {}
  ins._font = love.graphics.newFont(30)
  return ins
end

function Hud:draw ()
  love.graphics.setFont(self._font)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("("..self._picker:_getCurrentCollumn()..", "..self._picker:_getCurrentRow()..")", 10, 20)
  love.graphics.print(self._picker._tilemap:returnTileAtcollumnRow(self._picker:_getCurrentCollumn(), self._picker:_getCurrentRow()), 10, 80)
  love.graphics.print("Tool: "..self._picker:getCurrentTool(), 10, 120)
  local toolY = love.graphics.getHeight() - 150
  love.graphics.draw(Assets.hud[self._picker:getCurrentTool()], 10, toolY, 0, 4, 4)
end

return Hud
