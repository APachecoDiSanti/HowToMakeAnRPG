Character = {}
Character.__index = Character


function Character:Create(def, map)
  --Look up th entity
  local entityDef = gEntitites[def.entity]
  assert(entityDef) -- definition should exist

  local this = {
    mEntity = Entity:Create(entityDef),
    mAnims = def.anims,
    mFacing = def.facing
  }

  setmetatable(this, self)

  -- Create the controller states from the def
  local states = {}
  -- Make the controller state machine from the states (empty!)
  -- Empty state machine to break dependency loop between states and state machien
  this.mController = StateMachine:Create(states)

  for _, name in ipairs(def.controller) do
    local state = gCharacterStates[name]
    assert(state)
    assert(states[state.mName] == nil) -- State already in use if not nil!
    local instance = state:Create(this, map)
    states[state.mName] = function() return instance end
  end

  this.mController.states = states

  -- Change the statemachine to the initial state as defined in the def
  this.mController:Change(def.state)

  return this
end
