LoadLibrary("Renderer")
LoadLibrary("Sprite")
LoadLibrary("System")
LoadLibrary("Texture")


function array_as_str(a)
  local str = "{ "
  for i=1, #a do
    if type(a[i]) == "table" then
        str = str .. array_as_str(a[i]) .. ",\n"
    else
        str = str .. a[i] .. ", "
    end
  end
  str = str .. "}"
  return str
end


function get_uvs(atlas_size, tile_size, atlas_rows, atlas_cols)
    -- Atlas and tiles are assumed to be square so only width or height are needed for calculations
    -- UVs go from (0,0) in top left to (1,1) in bottom right
    -- We need to calculate the values for each tile: top left and bottom right, so 4 values for 2 coordinates
    tile_uv_size = tile_size / atlas_size
    u = 0
    v = 0
    tile_uvs = {}
    tile_n = 1
    for row = 1, atlas_rows do
        for col = 1, atlas_cols do
            tile_uvs[tile_n] = {u, v, tile_uv_size * col, tile_uv_size * row}
            u = u + tile_uv_size
            tile_n = tile_n + 1
        end
        v = v + tile_uv_size
    end
    return tile_uvs
end


gTextureAtlas = Texture.Find("atlas.png")


-- Our atlas has the tiles organized in the top row from 1 to 11
gMap =
{
    1,1,1,1,5,6, 7,1,   -- 1
    1,1,1,1,5,6,7,1,    -- 2
    1,1,1,1,5,6,7,1,    -- 3
    3,3,3,3,11,6,7,1,   -- 4
    9,9,9,9,9,9,10,1,   -- 5
    1,1,1,1,1,1,1,1,    -- 6
    1,1,1,1,1,1,2,3,    -- 7
}
gMapWidth = 8
gMapHeight = 7


gTileWidth = 32
gTileHeight = 32

gMapUvs = get_uvs(gTextureAtlas:GetWidth(), gTileWidth, 1, 11)
print(array_as_str(gMapUvs))

gDisplayWidth = System.ScreenWidth()
gDisplayHeight = System.ScreenHeight()

gTop = gDisplayHeight / 2 - gTileHeight / 2
gLeft = -gDisplayWidth / 2 + gTileWidth / 2


function GetTile(map, rowsize, x, y)
    x = x + 1 -- change from  1 -> rowsize
              -- to           0 -> rowsize - 1
    return map[x + y * rowsize]
end

gRenderer = Renderer.Create()

gTileSprite = Sprite.Create()
gTileSprite:SetTexture(gTextureAtlas)

function update()
    for j = 0, gMapHeight - 1 do
        for i = 0, gMapWidth - 1 do
            local tile = GetTile(gMap, gMapWidth, i, j)
            gTileSprite:SetUVs(unpack(gMapUvs[tile]))
            gTileSprite:SetPosition(gLeft + i * gTileWidth, gTop - j * gTileHeight)
            gRenderer:DrawSprite(gTileSprite)
        end
    end
end
