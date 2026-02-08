LoadLibrary("Renderer")
LoadLibrary("Sprite")
LoadLibrary("System")
LoadLibrary("Texture")

gRenderer =  Renderer:Create()

-- Position 0,0 is the middle of the screen
-- TopLeft is -width/2, height/2
-- TopRight is width/2, height/2
-- BottomLeft is -width/2, -height/2
-- BottomRight is width/2, -height/2
gLeft = -System.ScreenWidth() / 2
gRight = -gLeft
gTop = System.ScreenHeight() / 2
gBottom = -gTop

gGrassTexture = Texture.Find("grass_tile.png")
gTileWidth = gGrassTexture:GetWidth()
gTileHeight = gGrassTexture:GetHeight()

gDisplayWidth = System.ScreenWidth()
gDisplayHeight = System.ScreenHeight()

gTilesPerRow = math.ceil(gDisplayWidth/gTileWidth)
gTilesPerColumn = math.ceil(gDisplayHeight/gTileHeight)

-- Sprites are drawn in the center, we need to reposition it
gTileSprite = Sprite:Create()
gTileSprite:SetTexture(gGrassTexture)
-- Top Left
-- gTileSprite:SetPosition(gLeft + gTileWidth / 2, gTop - gTileHeight / 2)

-- Top Right
-- gTileSprite:SetPosition(gRight - gTileWidth / 2, gTop - gTileHeight / 2)

-- Bottom Left
-- gTileSprite:SetPosition(gLeft + gTileWidth / 2, gBottom + gTileHeight / 2)

-- Bottom Right
-- gTileSprite:SetPosition(gRight - gTileWidth / 2, gBottom + gTileHeight / 2)

-- Adjusting value with half of texture size to simplify code
gLeft = gLeft + gTileWidth / 2
gTop = gTop - gTileHeight / 2

-- Running each frame
function update()

  -- Fill screen with grass tile
  for i = 0, gTilesPerRow-1 do
    for j = 0, gTilesPerColumn -1 do
      sprWidth = gLeft + i * gTileWidth
      sprHeight = gTop - j * gTileHeight
      gTileSprite:SetPosition(sprWidth, sprHeight)
      gRenderer:DrawSprite(gTileSprite)
    end
  end
end
