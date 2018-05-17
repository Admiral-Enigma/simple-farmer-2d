
function drawOutlineTile (col, row, width, height, color)
  if not color then color = rgb(0,255,0) end
  love.graphics.setColor(color)
  love.graphics.rectangle("line", col * width, row * height, width, height)
end

function drawFillTile (col, row, width, height)
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", col * width, row * height, width, height)
end
