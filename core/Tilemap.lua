local Tilemap = {}
Tilemap.__index = Tilemap

function Tilemap:new(tile_width, tile_height, tiles_rows, tiles_collumns, tilemap_data)
  local ins = setmetatable({}, self)
  ins._tile_width = tile_width or 0
  ins._tile_height = tile_height or 0
  ins._tile_collumns = tiles_collumns or 0
  ins._tile_rows = tiles_rows or 0
  ins._tile_data = tilemap_data or {}
  return ins
end

function Tilemap:returnTileAtcollumnRow(collumn, row)
    if self:isInsideMap(collumn, row) then
      local index = self:_row_collumn_to_array_index(collumn, row)
      return self._tile_data[index]
    end
end

function Tilemap:getTileAtPoint(x, y)
  local pointcollumn = math.floor(x / self._tile_collumns)
  local pointRow = math.floor(y / self._tile_rows)
  local index = self:_row_collumn_to_array_index(pointcollumn, pointRow)
  if self:isInsideMap(pointcollumn, pointRow) then
    return self._tile_data[index]
  else
    return nil
  end
end

function Tilemap:_row_collumn_to_array_index (collumn, row)
  if self:isInsideMap(collumn, row) then
    return collumn + self._tile_collumns * row
  else
    return false
  end
end

function Tilemap:isInsideMap(collumn, row)
  if collumn >= 0 and collumn < self._tile_collumns and row >= 0 and row < self._tile_rows then
    return true
  else
    return false
  end
end

function Tilemap:draw()
  local index = 0
  local tile_draw_x = 0
  local tile_draw_y = 0

  for row=1,self._tile_rows do
    for collumn=1,self._tile_collumns do
      local tileID = self._tile_data[index]
      if tileID == 0 then
        love.graphics.setColor(47,129,54)
        love.graphics.rectangle("fill", tile_draw_x, tile_draw_y, self._tile_width, self._tile_height)
      elseif tileID == 1 then
        love.graphics.setColor(47,159,54)
        love.graphics.rectangle("fill", tile_draw_x, tile_draw_y, self._tile_width, self._tile_height)
      elseif tileID == 2 then
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

function Tilemap:changeTile (id, collumn, row)
  if self:isInsideMap(collumn, row) then
    local index = self:_row_collumn_to_array_index(collumn, row)
    self._tile_data[index] = id
  end
end

function Tilemap:getColumns ()
  return self._tile_collumns
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
