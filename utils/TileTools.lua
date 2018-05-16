
function drawOutlineTile (col, row, width, height)
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("line", col * width, row * height, width, height)
end

function drawFillTile (col, row, width, height)
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", col * width, row * height, width, height)
end
