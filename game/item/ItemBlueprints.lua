local blueprints = {}
--[[
  #Required
  - name
  - price
  - description
  - type # 0 = usable (seed, fertilizer) 1 = nonUsable(harvested crops, special items) 2 = placeAble(furniture and miscellaneous objects)
  - sellAble
  - stackAble
  #Optional
  - Icon
]]

blueprints.wheat = {
  name = "Wheat",
  price = 10,
  description = "Very wheaty much taste",
  type = 1,
  sellAble = true,
  stackAble = true
}

blueprints.droemmeKage = {
  name = "Drømmekage",
  price = 1337,
  description = "Smager sku meget godt",
  type = 2,
  sellAble = true,
  stackAble = false,
  Icon = Assets.kage
}

return blueprints
