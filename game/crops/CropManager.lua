local CropManager = {}
CropManager.__index = CropManager
local index = 1

function CropManager:new(tilemap)
  local ins = setmetatable({}, self)
  self._crops = {}
  self._tilemap = tilemap or {}
  return ins
end

function CropManager:createCrop (collumn, row, crop)
  local newCropX = collumn * self._tilemap:getTileWidth()
  local newCropY = row * self._tilemap:getTileHeight()
  local newCrop = Crop:new(crop.name, newCropX, newCropY, crop.growthTime, crop.images)
  table.insert(self._crops, newCrop)
  print(#self._crops)
end

function CropManager:update (dt)
  for k,v in ipairs(self._crops) do
    v:update(dt)
  end
end

function CropManager:draw ()
  for i = 1, #self._crops do
    self._crops[i]:draw()
  end
  
end


return CropManager
