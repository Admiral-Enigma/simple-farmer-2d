local globals = require "..globals"
local md5 = require 'core.lib.md5'
local ItemBlueprints = require "game.item.ItemBlueprints"

local Crop = {}
Crop.__index = Crop

function Crop:new(name, x, y, collumn, row, growthTime, images, harvestable, blueprint)
  local ins = setmetatable({}, self)
  ins._name = name or "Æbleskiver"
  ins._x = x or 0
  ins._y = y or 0
  ins._collumn = collumn or 0
  ins._row = row or 0
  ins._growthTime = growthTime or 1
  ins._frames = Assets.wheat
  ins._frameToDraw = math.ceil(#ins._frames / ins._growthTime)
  ins._harvestable = harvestable or false
  ins._blueprint = blueprint 
  ins._id = md5.sumhexa(tostring(math.random()))
  return ins
end

function Crop:tick ()
  if self._harvestable == false and self._growthTime > 1 then
    self._growthTime = self._growthTime - 1
    self._frameToDraw = math.ceil(#self._frames / self._growthTime)
    --print(self._growthTime)
    --print(self._harvestable)
    if self._growthTime == 1 then
      self._harvestable = true
      self._frameToDraw = #self._frames
    end
  end
end

function Crop:update (dt)
  -- Animations and stuff

end

function Crop:draw ()
  -- Reset color
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(self._frames[self._frameToDraw], self._x, self._y, 0, globals.scale.x, globals.scale.y)
end

function Crop:serialize ()
  return {
    name = self._name,
    x = self._x,
    y = self._y,
    collumn = self._collumn,
    row = self._row,
    growthTime = self._growthTime,
    harvestable = self._harvestable,
    id = self._id,
    blueprint = self._blueprint
  }
end

function Crop:getX ()
  return self._x
end

function Crop:getBlueprint ()
  return self._blueprint
end

function Crop:getY ()
  return self._y
end

function Crop:getFrames ()
  return self._frames
end

function Crop:getFrameToDraw ()
  return self._frameToDraw
end

function Crop:getName ()
  return self._name
end

function Crop:getHarvestable (args)
  return self._harvestable
end

function Crop:getCollumn ()
  return self._collumn
end

function Crop:getRow ()
  return self._row
end

function Crop:getId ()
  return self._id
end

return Crop
