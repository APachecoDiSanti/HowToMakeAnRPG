LoadLibrary("Renderer")
LoadLibrary("Sprite")
LoadLibrary("System")
LoadLibrary("Texture")
LoadLibrary("Asset")

Asset.Run("example_map.lua")

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

function GenerateUVs(tileWidth, tileHeight, texture)
    -- Atlas and tiles are assumed to be square so only width or height are needed for calculations
    -- UVs go from (0,0) in top left to (1,1) in bottom right
    -- We need to calculate the values for each tile: top left and bottom right, so 4 values for 2 coordinates
    local uvs = {}
    local textureWidth = texture:GetWidth()
    local textureHeight = texture:GetHeight()
    local width = tileWidth / textureWidth
    local height = tileHeight / textureHeight
    local cols = textureWidth / tileWidth
    local rows = textureHeight / tileHeight

    -- Start from top left
    local ux = 0
    local uy = 0
    local vx = width
    local vy = height

    for row = 0, rows - 1 do
        for col = 0, cols - 1 do
            table.insert(uvs, {ux + width * col, uy + height * row, vx + width * col, vy + height * row})
        end
    end
    return uvs
end

-- Get data from exported map
gTiledMap = CreateMap1()
gTextureAtlas = Texture.Find(gTiledMap.tilesets[1].image)
gMap = gTiledMap.layers[1]
gMapHeight = gMap.height
gMapWidth = gMap.width
gTileWidth = gTiledMap.tilesets[1].tilewidth
gTileHeight = gTiledMap.tilesets[1].tileheight
gTiles = gMap.data
gUVs = GenerateUVs(gTileWidth, gTileHeight, gTextureAtlas)

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
    -- Map gets drawn every frame
    for j = 0, gMapHeight - 1 do
        for i = 0, gMapWidth - 1 do
            local tile = GetTile(gTiles, gMapWidth, i, j)
            gTileSprite:SetUVs(unpack(gUVs[tile]))
            gTileSprite:SetPosition(gLeft + i * gTileWidth, gTop - j * gTileHeight)
            gRenderer:DrawSprite(gTileSprite)
        end
    end
end
