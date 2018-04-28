local Hud = {}
Hud.__index = Hud

function Hud:new(picker)
  local ins = setmetatable({}, self)
  self._picker = picker or {}
  self._font = love.graphics.newFont(40)
  return ins
end

function Hud:draw ()
  love.graphics.setFont(self._font)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("("..self._picker:_getCurrentCollumn()..", "..self._picker:_getCurrentRow()..")", 10, 20)
  love.graphics.print(self._picker._tilemap:returnTileAtcollumnRow(self._picker:_getCurrentCollumn() + 1, self._picker:_getCurrentRow()), 10, 80)
end

return Hud