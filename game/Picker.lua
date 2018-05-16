local Picker = {}
Picker.__index = Picker
local tileTools = require "utils.TileTools"

function Picker:new(tilemap, cropmanager)
  local ins = setmetatable({}, self)
  ins._x = 0
  ins._y = 0
  ins._tilemap = tilemap
  ins._tilewidth = tilemap:getTileWidth()
  ins._tileheight = tilemap:getTileHeight()
  ins._cropmanager = cropmanager or {}
  ins._currentTool = 1
  return ins
end

function Picker:update(dt)
end

function Picker:keypressed(key, scancode, isrepeat)


end

function Picker:draw ()
  drawOutlineTile(self:_getCurrentCollumn(), self:_getCurrentRow(), self._tilemap:getTileWidth(), self._tilemap:getTileHeight())
end

function Picker:_getCurrentRow ()
  return math.floor(self._y / self._tilemap:getTileHeight())
end

function Picker:_getCurrentCollumn ()
  return math.floor(self._x / self._tilemap:getTileWidth())
end

function Picker:getX ()
  return self._x
end

function Picker:getY ()
  return self._y
end

function Picker:setX (x)
  self._x = x
  print(x)
end

function Picker:setY (y)
  self._y = y
end


function Picker:getCurrentTool ()
  return self._currentTool
end

return Picker
