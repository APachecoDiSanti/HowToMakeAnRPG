JumpingNumbers = {}
JumpingNumbers.__index = JumpingNumbers


function JumpingNumbers:Create(x, y, number, color)
  local this = {
    mX = x or 0,
    mY = y or 0,
    mGravity = 700, -- px/s
    mFadeDistance = 33, -- px
    mScale = 1.3,
    mNumber = number or 0, -- to display
    mColor = color or Vector.Create(1, 1, 1, 1),
    mPriority = 1,
  }
  this.mCurrentY = this.mY
  this.mVelocityY = 224

  setmetatable(this, self)
  return this
end


function JumpingNumbers:Update(dt)
  self.mCurrentY = self.mCurrentY + (self.mVelocityY * dt)
  self.mVelocityY = self.mVelocityY - (self.mGravity * dt)

  if self.mCurrentY <= self.mY then
    local fade01 = (self.mY - self.mCurrentY) / self.mFadeDistance
    self.mColor:SetW(1 - fade01)
  end
end


function JumpingNumbers:Render(renderer)
  renderer:ScaleText(self.mScale, self.mScale)
  renderer:AlignText("center", "center")
  renderer:DrawText2d(
    self.mX,
    math.floor(self.mCurrentY),
    tostring(self.mNumber),
    self.mColor
  )
end


function JumpingNumbers:IsFinished()
  -- has it passed the fade out point?
  return self.mCurrentY <= (self.mY - self.mFadeDistance)
end
