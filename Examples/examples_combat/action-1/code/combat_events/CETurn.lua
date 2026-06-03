CETurn = {}
CETurn.__index = CETurn


function CETurn:Create(state, owner)
  local this = {
    mState = state,
    mOwner = owner,
    mIsFinished = false
  }
  this.mName = string.format("Turn for %s", this.mOwner.mName)
  
  setmetatable(this, self)
  return this
end


function CETurn:TimePoints(queue)
  local speed = self.mOwner.mStats:Get("speed")
  return queue:SpeedToTimePoints(speed)
end


function CETurn:Execute(queue)
  print("CETurn:Execute(queue)")
  print("self.mOwner", self.mOwner)
  if self.mState:IsPartyMember(self.mOwner) then
    print("self.mState:IsPartyMember(self.mOwner)")
    local state = CombatChoiceState:Create(self.mState, self.mOwner)
    self.mState.mStack:Push(state)
    self.mIsFinished = true
    return
  else
    self.mIsFinished = true
    return
  end
end


function CETurn:Update() end


function CETurn:IsFinished()
  return self.mIsFinished
end
