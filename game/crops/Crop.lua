local Crop = {}
Crop.__index = Crop

function Crop:new(name, x, y, growthTime, images)
  local ins = setmetatable({}, self)
  ins._name = name or "Æbleskiver"
  ins._x = x or 0
  ins._y = y or 0
  ins._growthTime = growthTime or 1
  ins._frames = images or {}
  ins._frameToDraw = math.ceil(#ins._frames / ins._growthTime)
  ins._harvestable = false
  return ins
end

function Crop:tick ()
  if self._harvestable == false and self._growthTime > 0 then
    self._growthTime = self._growthTime - 1
    self._frameToDraw = math.ceil(#self._frames / self._growthTime)
    print(self._growthTime)
    print(self._harvestable)
    if self._growthTime == 0 then
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
  love.graphics.draw(self._frames[self._frameToDraw], self._x, self._y, 0, Scale.x, Scale.y)
end

function Crop:getX ()
  return self._x
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

return Crop
