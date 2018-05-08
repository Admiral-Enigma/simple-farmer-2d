local Barn = {}
Barn.__index = Barn
local Item = require "game.item.Item"
local ItemBlueprints = require "game.item.ItemBlueprints"

function Barn:new ()
  local ins = setmetatable({}, self)
  ins._items = {}
  return ins
end

function Barn:addItem (itemBlueprint)
  local newItem = Item:new(itemBlueprint)
  table.insert(self._items, newItem)
end

function Barn:getItems ()
  return self._items
end

return Barn
