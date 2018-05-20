local Textbox = {}
Textbox.__index = Textbox
local Panel = require "game.ui.gui.Panel"

function Textbox:new (x, y, width, height, font)
  local ins = setmetatable({}, self)
  ins.panel = Panel:new(x, y, width, height)
  ins.x = x
  ins.y = y
  ins.width = width
  ins.height = height
  ins.font = font or love.graphics.newFont(30)
  ins.lines = {}
  return ins
end

function Textbox:addLine (x, y, text, wrap)
  local line = {x = x, y=y, text=text, wrap=wrap}
  table.insert(self.lines, line)
end

function Textbox:clearLines ()
  for k in pairs (self.lines) do
      self.lines[k] = nil
  end
end

function Textbox:draw ()
  self.panel:draw()
  love.graphics.setColor(rgb(255,255,255))
  for k,v in ipairs(self.lines) do
    if v.wrap then
      love.graphics.printf(v.text, self.x + v.x, self.y + v.y, self.width - 10)
    else
      love.graphics.print(v.text, self.x + v.x, self.y + v.y)
    end
  end
end

return Textbox
