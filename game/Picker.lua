local Picker = {}
Picker.__index = Picker
local name = require "..utils.TileTools"

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
  if key == "w" then
    if self._tilemap:isInsideMap(math.floor((self._y - self._tileheight) / self._tilemap:getTileHeight()), self:_getCurrentRow()) then
      self._y = self._y - self._tileheight
    end
  end
  if key == "s" then
    if self._tilemap:isInsideMap(math.floor((self._y + self._tileheight ) / self._tilemap:getTileHeight()), self:_getCurrentRow()) then
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
    if self._currentTool == 1 then
      self._tilemap:changeTile(2, self:_getCurrentCollumn(), self:_getCurrentRow())
    elseif self._currentTool == 2 then

    elseif self._currentTool == 3 then
      self._cropmanager:harvest(self:_getCurrentCollumn(), self:_getCurrentRow())

    elseif self._currentTool == 4 then
      local tile = self._tilemap:returnTileAtcollumnRow(self:_getCurrentCollumn(), self:_getCurrentRow())
      local crop = {name = "Fisksild", growthTime = 10, images = Assets.wheat, blueprint = ItemBlueprints.wheat}
      if tile == 2 then
        self._cropmanager:createCrop(self:_getCurrentCollumn(), self:_getCurrentRow(), crop)
      end
    end
  end
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

function Picker:getCurrentTool ()
  return self._currentTool
end

return Picker
