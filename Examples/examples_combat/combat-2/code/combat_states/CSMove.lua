CSMove = { mName = "cs_move"}
CSMove.__index = CSMove


function CSMove:Create(character, context)
  local this = {
    mCharacter = character,
    mCombatScene = context
  }

  setmetatable(this, self)
  return this
end


function CSMove:Enter() end
function CSMove:Exit() end
function CSMove:Update(dt) end
function CSMove:Render(renderer) end
