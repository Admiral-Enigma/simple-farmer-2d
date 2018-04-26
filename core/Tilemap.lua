local Tilemap = {}
Tilemap.__index = Tilemap

function Tilemap:new(tile_width, tile_height, tiles_rows, tiles_collums, tilemap_data)
  local ins = setmetatable({}, self)
  ins._tile_width = tile_width or 0
  ins._tile_height = tile_height or 0
  ins._tile_collums = tiles_collums or 0
  ins._tile_rows = tiles_rows or 0
  ins._tile_data = tilemap_data or {}
  return ins
end

function Tilemap:returnTileAtCollumRow(collum, row)
    if self:isInsideMap(collum, row) then
      local index = self:_row_collum_to_array_index(collum, row)
      return self._tile_data[index]
    end
end

function Tilemap:getTileAtPoint(x, y)
  local pointCollum = love.math.floor(x / self._tile_collums)
  local pointRow = love.math.floor(y / self._tile_rows)
  local index = self:_row_collum_to_array_index(pointCollum, pointRow)
  if self:isInsideMap(pointCollum, pointRow) then
    return self._tile_data[index]
  else
    return nil
  end
end

function Tilemap:_row_collum_to_array_index (collum, row)
  return collum + self._tile_collums * row
end

function Tilemap:isInsideMap(collum, row)
  if collum >= 0 and collum < self._tile_collums and row >= 0 and row < self._tile_rows then
    return true
  else
    return false
  end
end

function Tilemap:draw()
  index = 1
  tile_draw_x = 0
  tile_draw_y = 0

  for row=1,self._tile_rows do
    for collum=1,self._tile_collums do
      local tileID = self._tile_data[index]
      if tileID == 0 then
        love.graphics.setColor(47,129,54)
        love.graphics.rectangle("fill", tile_draw_x, tile_draw_y, self._tile_width, self._tile_height)
      else
        love.graphics.setColor(240,147,43)
        love.graphics.rectangle("fill", tile_draw_x, tile_draw_y, self._tile_width, self._tile_height)
      end

      tile_draw_x = tile_draw_x + self._tile_width
      index = index + 1
    end
    tile_draw_y = tile_draw_y + self._tile_height
    tile_draw_x = 0
  end
end

function Tilemap:getColumns ()
  return self._tile_collums
end
function Tilemap:getRows ()
  return self._tile_rows
end
function Tilemap:getTileWidth ()
  return self._tile_width
end
function Tilemap:getTileHeight ()
  return self._tile_height
end

return Tilemap
