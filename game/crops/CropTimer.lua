local CropTimer = {}
CropTimer.__index = CropTimer

function CropTimer:new ()
  local ins = setmetatable({}, self)
  Timer.every(1, function () Signal.emit('cropTick') end)
  Timer.every(10, function () Signal.emit('save') end)
  return ins
end

function CropTimer:update (dt)
  Timer.update(dt)
end
return CropTimer
