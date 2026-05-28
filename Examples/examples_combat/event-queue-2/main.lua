LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

Asset.Run("CombatScene.lua")
Asset.Run("EventQueue.lua")
Asset.Run("CETurn.lua")
Asset.Run("CEAttack.lua")

party = {
    -- our hero
    {
      mName = "hero",
      mSpeed = 3,
      mAttack = 2,
      mHP = 5,
      IsPlayer = function() return true end,
      IsKOed = function(self) return self.mHP <= 0 end,
      KO = function(self) self.mHP = 0 end
    }
  }

enemies = {
    -- enemy
    {
      mName = "goblin",
      mSpeed = 2,
      mAttack = 2,
      mHP = 5,
      IsPlayer = function() return false end,
      IsKOed = function(self) return self.mHP <= 0 end,
      KO = function(self) self.mHP = 0 end
    }
  }

gCombatScene = CombatScene:Create(party, enemies)

print("--start--")

function update()
    gCombatScene:Update()
end
