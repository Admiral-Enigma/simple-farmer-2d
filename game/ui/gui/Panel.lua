local Panel = {}
Panel.__index = Panel

function Panel:new (x, y, width, height)
  local ins = setmetatable({}, self)
  ins.x = x
  ins.y = y
  ins.width = width
  ins.height = height
  ins.visible = true
  return ins
end

function Panel:draw ()
  if self.visible then
    love.graphics.setColor(rgb(255,255,255))
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 3)
    love.graphics.setColor(rgb(56, 56, 56))
    love.graphics.rectangle('fill', self.x + 2, self.y + 2, self.width - 4, self.height - 4, 3)
  end
end

function Panel:toggle ()
  self.visible = not self.visible
end

return Panel
