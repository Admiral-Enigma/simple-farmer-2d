local Dialogbox = {}
Dialogbox.__index = Dialogbox
local Panel = require "game.ui.gui.Panel"
--[[
    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

function Dialogbox:new (x, y, width, height, text, font)
  local ins = setmetatable({}, self)
  ins.panel = Panel:new(x, y, width, height)
  ins.x = x
  ins.y = y
  ins.width = width
  ins.height = height
  ins.text = text
  ins.font = font or love.graphics.newFont(30)
  _, ins.textChunks = self.font:getWrap(ins.text, ins.width - 12)

  self.chunkCounter = 1
  self.endOfLine = false
  self.done = false
  self:next()
  return ins
end

function Dialogbox:nextChunks ()
  local chunks = {}
  for i = self.chunkCounter, self.chunkCounter + 2 do
    table.insert(chunks, self.textChunks[i])
    if i == #self.textChunks then
      self.endOfLine = true
      return chunks
    end
  end
  self.chunkCounter = self.chunkCounter + 3
  return chunks
end

function Dialogbox:next()
    if self.endOfLine then
        self.textChunks = {}
        self.panel:toggle()
        self.done = true
    else
        self.textChunks = self:nextChunks()
    end
end

function Dialogbox:update(dt)
    if love.keyboard.wasPressed('space') or love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        self:next()
    end
end

function Dialogbox:isDone()
    return self.done
end

function Dialogbox:draw ()
  self.panel:draw()
  love.graphics.setFont(self.font)
  for i = 1, #self.textChunks do
      love.graphics.print(self.textChunks[i], self.x + 3, self.y + 3 + (i - 1) * 16)
  end
end


return Dialogbox
