local CropManager = {}
CropManager.__index = CropManager

function CropManager:new()
  local ins = setmetatable({}, self)
  self._crops = {}
  return ins
end




return CropManager
