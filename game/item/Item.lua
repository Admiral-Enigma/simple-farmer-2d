local Item = {}
Item.__index = Item

function Item:new (itemBluprint)
  local ins = setmetatable({}, self)
  ins._propertys = itemBluprint or {}
  return ins
end

function Item:getProperty (property)
  local prop = self._propertys[property]
  if not prop then return end
  return prop
end

return Item
