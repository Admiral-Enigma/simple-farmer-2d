local CropManager = {}
CropManager.__index = CropManager
local index = 1

function CropManager:new(tilemap)
  local ins = setmetatable({}, self)
  ins._crops = {}
  ins._tilemap = tilemap or {}
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

function CropManager:tick ()
  for k,v in ipairs(self._crops) do
    v:tick()
  end
end

function CropManager:draw ()
  for k,v in ipairs(self._crops) do
    v:draw()
  end
end


return CropManager
