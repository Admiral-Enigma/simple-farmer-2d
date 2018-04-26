local Picker = {}
Picker.__index = Picker
local name = require "..utils.TileTools"
function Picker:new(tilemap)
  local ins = setmetatable({}, self)
  self._x = 0
  self._y = 0
  self._tilemap = tilemap
  self._tilewidth = tilemap:getTileWidth()
  self._tileheight = tilemap:getTileHeight()

  return ins
end

function Picker:update(dt)

end

function Picker:keypressed(key, scancode, isrepeat)
  if key == "w" then
    if self._tilemap:isInsideMap(math.floor((self._y - self._tileheight) / self._tilemap:getTileHeight()), self:_getCurrentRow()) then
      self._y = self._y - self._tileheight
      print(math.floor((self._y - 32) / self._tilemap:getTileHeight()))
    end
  end
  if key == "s" then
    if self._tilemap:isInsideMap(math.floor((self._y + self._tileheight )/ self._tilemap:getTileHeight()), self:_getCurrentRow()) then
      self._y = self._y + self._tileheight
    end
  end
  if key == "a" then
    if self._tilemap:isInsideMap(self:_getCurrentCollumn(), math.floor((self._x - self._tilewidth) / self._tilemap:getTileWidth())) then
      self._x = self._x - self._tilewidth
    end
  end
  if key == "d" then
    if self._tilemap:isInsideMap(self:_getCurrentCollumn(), math.floor((self._x + self._tilewidth) / self._tilemap:getTileWidth())) then
      self._x = self._x + self._tilewidth
      print(math.floor((self._x - 32) / self._tilemap:getTileWidth()))
    end
  end
end

function Picker:draw ()
  local collum = math.floor(self._x / self._tilemap:getTileWidth())
  local row = math.floor(self._y / self._tilemap:getTileHeight())
  drawOutlineTile(collum, row, 32, 32)
end

function Picker:_getCurrentRow ()
  return math.floor(self._y / self._tilemap:getTileHeight())
end

function Picker:_getCurrentCollumn ()
  return math.floor(self._x / self._tilemap:getTileWidth())
end

return Picker
