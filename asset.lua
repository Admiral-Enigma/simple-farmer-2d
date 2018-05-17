local assets = {}

assets.wheat = {
  love.graphics.newImage("res/crops/wheat/wheat0.png"),
  love.graphics.newImage("res/crops/wheat/wheat1.png"),
  love.graphics.newImage("res/crops/wheat/wheat2.png")
}
assets.kage = love.graphics.newImage("res/items/dkage.png")
assets.hud = {
  love.graphics.newImage("res/hud/tool0.png"),
  love.graphics.newImage("res/hud/tool1.png"),
  love.graphics.newImage("res/hud/tool2.png"),
  love.graphics.newImage("res/hud/tool3.png")

}

assets.player = love.graphics.newImage("res/placeHolderPlayer.png")

return assets
