Panel = {}
Panel.__index = Panel


function Panel:Create(params)
  local this = {
    mTexture = params.texture,
    mUVs = GenerateUVs(params.size, params.size, params.texture),
    mTileSize = params.size,
    mTiles = {}, -- Sprites representing the border
  }

  -- Create a sprite for each tile of the panel
  for k, v in ipairs(this.mUVs) do
    local sprite = Sprite:Create()
    sprite:SetTexture(this.mTexture)
    sprite:SetUVs(unpack(v))
    this.mTiles[k] = sprite
  end

  setmetatable(this, self)
  return this
end


-- The parameters form two points: Top-Left and Bottom-Right
function Panel:Position(left, top, right, bottom)
  -- Reset scales
  for _, v in ipairs(self.mTiles) do
    v:SetScale(1, 1)
  end

  local hSize = self.mTileSize / 2

  -- Align the corner tiles
  self.mTiles[1]:SetPosition(left + hSize, top - hSize)
  self.mTiles[3]:SetPosition(right - hSize, top - hSize)
  self.mTiles[7]:SetPosition(left + hSize, bottom + hSize)
  self.mTiles[9]:SetPosition(right - hSize, bottom + hSize)

  -- Calculate how much to scale the side tiles
  local widthScale = (math.abs(right - left) - (2 * self.mTileSize)) / self.mTileSize
  local centerX = (right + left) / 2

  -- Top
  self.mTiles[2]:SetPosition(centerX, top - hSize)
  self.mTiles[2]:SetScale(widthScale, 1)

  -- Bottom
  self.mTiles[8]:SetPosition(centerX, bottom + hSize)
  self.mTiles[8]:SetScale(widthScale, 1)

  local heightScale = (math.abs(bottom - top) - (2 * self.mTileSize)) / self.mTileSize
  local centerY = (bottom + top) / 2

  -- Left
  self.mTiles[4]:SetScale(1, heightScale)
  self.mTiles[4]:SetPosition(left + hSize, centerY)

  -- Right
  self.mTiles[6]:SetScale(1, heightScale)
  self.mTiles[6]:SetPosition(right - hSize, centerY)

  -- Scale the middle backing panel
  self.mTiles[5]:SetScale(widthScale, heightScale)
  self.mTiles[5]:SetPosition(centerX, centerY)

  -- Hide corner tiles when scale is equal to zero
  if left - right == 0 or top - bottom == 0 then
    for _, v in ipairs(self.mTiles) do
      v:SetScale(0, 0)
    end
  end
end


function Panel:CenterPosition(x, y, width, height)
  -- Drawing a panel from the center
  local hWidth = width / 2
  local hHeight = height / 2
  return self:Position(x - hWidth, y + hHeight, x + hWidth, y - hHeight)
end


function Panel:Render(renderer)
  for _, v in ipairs(self.mTiles) do
    renderer:DrawSprite(v)
  end
end
