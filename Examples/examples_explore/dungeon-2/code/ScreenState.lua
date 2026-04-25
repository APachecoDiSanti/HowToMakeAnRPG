ScreenState = {}
ScreenState.__index = ScreenState


function ScreenState:Create(color)
  params = params or {}
  local this = {
    mColor = color or Vector.Create(0, 0, 0, 1)
  }

  setmetatable(this, self)
  return this
end


function ScreenState:Enter() end
function ScreenState:Exit() end
function ScreenState:HandleInput() end


function ScreenState:Update(dt)
  return true
end


function ScreenState:Render(renderer)
  local screenWidth = System.ScreenWidth()/2
  local screenHeight = System.ScreenHeight()/2
  renderer:DrawRect2d(-screenWidth, screenHeight, screenWidth, -screenHeight, self.mColor)
end
