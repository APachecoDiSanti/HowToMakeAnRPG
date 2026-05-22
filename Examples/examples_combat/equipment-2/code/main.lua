LoadLibrary('Asset')
Asset.Run('Dependencies.lua')

gRenderer = Renderer.Create()
gStack = StateStack:Create()
gWorld = World:Create()

gWorld.mParty:Add(Actor:Create(gPartyMemberDefs.hero))

gStack:Push(ExploreState:Create(gStack, CreateArenaMap(), Vector.Create(30, 18, 1)))

_, gHero = next(gWorld.mParty.mMembers)
gBoneBlade = ItemDB[1]
gWorldStaff = ItemDB[4]

gWorld:AddItem(gBoneBlade.id)
gHero:Equip("weapon", gWorld.mItems[1])

local diff = gHero:PredictStats("weapon", gWorldStaff)
print("Diffs")
for k, v in pairs(diff) do
    print(k, v)
end

function update()
    local dt = GetDeltaTime()
    gStack:Update(dt)
    gStack:Render(gRenderer)
    gWorld:Update(dt)
end
