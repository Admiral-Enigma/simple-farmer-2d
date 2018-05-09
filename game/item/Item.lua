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
  ins.amount = 1
  return ins
end

function Item:changeAmount (amount)
  self.amount = self.amount + amount
end

function Item:getName ()
  return self.name
end
function Item:serialize ()
  return {
    name = self.name,
    price = self.price,
    description = self.description,
    type = self.type,
    sellAble = self.sellAble,
    stackAble = self.stackAble,
    amount = self.amount,
  }

end

return Item
