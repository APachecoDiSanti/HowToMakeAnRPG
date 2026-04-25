-- All storyboad events should implement these functions
-- GEvent = {
--   function Create() ... end,
--   function Update(dt) ... end,
--   function IsBlocking() ... end,
--   function IsFinished() ... end,
-- }

WaitEvent = {}
WaitEvent.__index = WaitEvent


function WaitEvent:Create(seconds)
  local this = {
    mSeconds = seconds,
  }

  setmetatable(this, self)
  return this
end


function WaitEvent:Update(dt)
  self.mSeconds = self.mSeconds - dt
end


function WaitEvent:IsBlocking()
  return true
end


function WaitEvent:IsFinished()
  return self.mSeconds <= 0
end


-- This function returns another function that is going to be called when the storyboard runs
function Wait(seconds)
  return function (storyboard)
    return WaitEvent:Create(seconds)
  end
end
