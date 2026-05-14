Actor = {}
Actor.__index = Actor


function Actor:Create(def)
  local this = {
    mDef = def,
    mStats = Stats:Create(def.stats),
    mStatGrowth = def.statGrowth,
    mXp = 0,
    mLevel = 1,
  }

  this.mNextLevelXP = NextLevel(this.mLevel)

  setmetatable(this, self)
  return this
end


function Actor:ReadyToLevelUp()
  return self.mXp >= self.mNextLevelXP
end


function Actor:AddXP(xp)
  self.mXp = self.mXp + xp
  return self:ReadyToLevelUp()
end


function Actor:CreateLevelUp()
  local levelup = {
    xp = -self.mNextLevelXP,
    level = 1,
    stats = {},
  }

  for id, dice in paits(self.mStatGrowth) do
    levelup.stats[id] = dice:Roll()
  end

  return levelup
end


function Actor:ApplyLevel(levelup)
  self.mXp = self.mXp + levelup.xp
  self.mLevel = self.mLevel + levelup.level
  self.mNextLevelXP = NextLevel(self.mLevel)

  assert(self.mXp >= 0)

  for k, v in pairs(levelup.stats) do
    self.mStats.mBase[k] = self.mStats.mBase[k] + v
  end
end
