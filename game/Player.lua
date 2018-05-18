local Player = {}
Player.__index = Player
local tileTools = require "utils.TileTools"
local Picker = require "game.Picker"
local tweenMethod = "linear"
local tweenTime = 0.5

function Player:new(tilemap, cropmanager)
  local ins = setmetatable({}, self)
  ins._x = 0
  ins._y = 0
  ins._tilemap = tilemap
  ins._tilewidth = tilemap:getTileWidth()
  ins._tileheight = tilemap:getTileHeight()
  ins._picker = Picker:new(tilemap, cropmanager)
  ins._cropmanager = cropmanager or {}
  ins.state = "idle"
  ins.dir = 1
  ins._currentTool = 1
  return ins
end

function Player:update(dt)
  if love.keyboard.isDown("w") then
    self:move("north")
  end

  if love.keyboard.isDown("s") then
    self:move("south")

  end

  if love.keyboard.isDown("d") then
    self:move("east")
    self.dir = -1

  end

  if love.keyboard.isDown("a") then
    self:move("west")
    self.dir = 1
  end

  if love.keyboard.isDown("f") then
    if self._currentTool == 1 then
      self._tilemap:changeTile(2, self._picker:_getCurrentCollumn(), self._picker:_getCurrentRow())
    elseif self._currentTool == 2 then

    elseif self._currentTool == 3 then
      self._cropmanager:harvest(self._picker:_getCurrentCollumn(), self._picker:_getCurrentRow())

    elseif self._currentTool == 4 then
      local tile = self._tilemap:returnTileAtcollumnRow(self._picker:_getCurrentCollumn(), self._picker:_getCurrentRow())
      local crop = {name = "Fisksild", growthTime = 10, images = Assets.wheat, blueprint = ItemBlueprints.wheat}
      if tile == 2 then
        self._cropmanager:createCrop(self._picker:_getCurrentCollumn(), self._picker:_getCurrentRow(), crop)
      end
    end
  end
  self._picker:setX(self._x)
  self._picker:setY(self._y)
end

function Player:keypressed(key, scancode, isrepeat)

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


end

function Player:move (dir)
  if dir == "north" then
    if self.state == "idle" and self._tilemap:isInsideMap(math.floor((self._y - self._tileheight) / self._tilemap:getTileHeight()), self:_getCurrentRow()) then
      self.state = "moving"

      Timer.tween(tweenTime, self, {_x = self._x, _y = self._y - self._tileheight}, tweenMethod, function ()
        self.state = "idle"
      end)

    end
  elseif dir == "south" then
    if self.state == "idle" and self._tilemap:isInsideMap(math.floor((self._y + self._tileheight ) / self._tilemap:getTileHeight()), self:_getCurrentRow()) then
      self.state = "moving"

      Timer.tween(tweenTime, self, {_x = self._x, _y = self._y + self._tileheight}, tweenMethod, function ()
        self.state = "idle"
      end)

    end
  elseif dir == "east" then
    if self.state == "idle" and self._tilemap:isInsideMap(self:_getCurrentCollumn(), math.floor((self._x + self._tilewidth) / self._tilemap:getTileWidth())) then
      self.state = "moving"

      Timer.tween(tweenTime, self, {_x = self._x + self._tilewidth, _y = self._y}, tweenMethod, function ()
        self.state = "idle"
      end)

    end
  elseif dir == "west" then
    if self.state == "idle" and self._tilemap:isInsideMap(self:_getCurrentCollumn(), math.floor((self._x - self._tilewidth) / self._tilemap:getTileWidth())) then
      self.state = "moving"

      Timer.tween(tweenTime, self, {_x = self._x - self._tilewidth, _y = self._y}, tweenMethod, function ()
        self.state = "idle"
      end)
    end
  end
end

function Player:draw ()
  drawOutlineTile(self:_getCurrentCollumn(), self:_getCurrentRow(), self._tilemap:getTileWidth(), self._tilemap:getTileHeight(), rgba(99,199,77,255))
  love.graphics.setColor(rgb(255,255,255))
  if self.dir == 1 then
    love.graphics.draw(Assets.player, self._x, self._y, 0, self.dir, 1, 0, 32)
  else
    love.graphics.draw(Assets.player, self._x, self._y, 0, self.dir, 1, 32, 32)
  end
end

function Player:_getCurrentRow ()
  return math.floor(self._y / self._tilemap:getTileHeight())
end

function Player:_getCurrentCollumn ()
  return math.floor(self._x / self._tilemap:getTileWidth())
end

function Player:getX ()
  return self._x
end

function Player:getY ()
  return self._y
end

function Player:getCurrentTool ()
  return self._currentTool
end

return Player
