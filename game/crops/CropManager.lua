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
  if self:_cropAt(collumn, row) == false then
    local newCropX = collumn * self._tilemap:getTileWidth()
    local newCropY = row * self._tilemap:getTileHeight()
    local newCrop = Crop:new(crop.name, newCropX, newCropY, collumn, row, crop.growthTime, crop.images)
    table.insert(self._crops, newCrop)
    print("Created Crop")
  end
end

function CropManager:_cropAt (collumn, row)
  local isCrop = false
  for k,v in ipairs(self._crops) do
    if v:getCollumn() == collumn and v:getRow() == row then
      isCrop = true
      break
    end
  end
  return isCrop
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
