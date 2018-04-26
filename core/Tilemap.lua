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


function Tilemap:draw()
  index = 1
  tile_draw_x = 0
  tile_draw_y = 0

  for row=1,self._tile_rows do
    for collum=1,self._tile_collums do
      local tileID = self._tile_data[index]
      if tileID == 0 then
        love.graphics.setColor(0,0,255)
        love.graphics.rectangle("fill", tile_draw_x, tile_draw_y, self._tile_width, self._tile_height)
      else
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle("fill", tile_draw_x, tile_draw_y, self._tile_width, self._tile_height)
      end

      tile_draw_x = tile_draw_x + self._tile_width
      index = index + 1
    end
    tile_draw_y = tile_draw_y + self._tile_height
    tile_draw_x = 0
  end
end

return Tilemap
