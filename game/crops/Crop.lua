local Crop = {}
Crop.__index = Crop

function Crop:new(name, x, y, growthTime, images)
  local ins = setmetatable({}, self)
  self._name = name or "Æbleskiver"
  self._x = x or 0
  self._y = y or 0
  self._growthTime = growthTime or 1
  self._frames = images or {}
  self._frameToDraw = math.ceil(#self._frames / self._growthTime)
  self._harvestable = false
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

return Crop
