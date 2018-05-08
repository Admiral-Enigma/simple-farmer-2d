local Item = {}
Item.__index = Item

function Item:new (itemBluprint)
  local ins = setmetatable({}, self)
  ins.name = itemBluprint.name or ""
  ins.price = itemBluprint.price or 0
  ins.description = itemBluprint.description or ""
  ins.type = itemBluprint.type or 1
  ins.sellAble = itemBluprint.sellAble or false
  ins.stackAble = itemBluprint.stackAble or false
  return ins
end


function Item:serialize ()

end

return Item
