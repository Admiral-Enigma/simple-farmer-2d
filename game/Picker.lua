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
  self._currentTool = 1
  return ins
end

function Picker:update(dt)
end

function Picker:keypressed(key, scancode, isrepeat)
  if key == "w" then
    if self._tilemap:isInsideMap(math.floor((self._y - self._tileheight) / self._tilemap:getTileHeight()), self:_getCurrentRow()) then
      self._y = self._y - self._tileheight
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
    end
  end
  --[[]
  1 hoe,
  2 shovel,
  3 sickle,
  4 seed
  ]]--

  if key == "1" then
    if self._currentTool > 1 then
      self._currentTool = self._currentTool - 1
    end
  end

  if key == "3" then
    if self._currentTool < 4 then
      self._currentTool = self._currentTool + 1
    end
  end

  if key == "f" then
    self._tilemap:changeTile(2, self:_getCurrentCollumn(), self:_getCurrentRow())
  end
end

function Picker:draw ()
  local collum = math.floor(self._x / self._tilemap:getTileWidth())
  local row = math.floor(self._y / self._tilemap:getTileHeight())
  drawOutlineTile(collum, row, self._tilemap:getTileWidth(), self._tilemap:getTileHeight())
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

function Picker:getCurrentTool ()
  return self._currentTool
end

return Picker
