local Picker = {}
Picker.__index = Picker
local name = require "..utils.TileTools"
function Picker:new(tilemap)
  local ins = setmetatable({}, self)
  self._x = 0
  self._y = 0
  self._tilemap = tilemap
  return ins
end

function Picker:update(dt)
  self._x = love.mouse.getX()
  self._y = love.mouse.getY()

end

function Picker:draw ()
  local collum = math.floor(self._x / 32)
  local row = math.floor(self._y / 32)
  drawOutlineTile(collum, row, 32, 32)

end

return Picker
