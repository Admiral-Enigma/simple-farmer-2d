local Barn = {}
Barn.__index = Barn
local Item = require "game.item.Item"

function Barn:new ()
  local ins = setmetatable({}, self)
  ins._items = {}
  Signal.register('save', function ()
    ins:saveState()
  end)
  return ins
end

function Barn:load ()
  local items = saveEngine:getDataStore("items")
  for k,v in ipairs(items) do
    self:addItem(v, v.amount)
  end
end

function Barn:addItem (itemBlueprint, amount)
  local itemInfo = self:_hasItem(itemBlueprint.name)
  if itemInfo[1] then
    self._items[itemInfo[2]]:changeAmount(1)
  else
    local newItem = Item:new(itemBlueprint, amount)
    table.insert(self._items, newItem)
  end
end

function Barn:saveState ()
  saveEngine:clearDataStore("items")
  for k,v in ipairs(self._items) do
    saveEngine:saveItem("items", v:serialize())
  end
end

function Barn:_hasItem (name)
  local hasItem = false
  local key = nil
  for k,v in ipairs(self._items) do
    if v:getName() == name then
      hasItem = true
      key = k
    end
  end
  return {hasItem, key}
end
function Barn:getItems ()
  return self._items
end

return Barn
