LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

Asset.Run("dice.lua")
Asset.Run("stats.lua")

gRenderer = Renderer.Create()

local stats =
Stats:Create
{
    ["hp_now"] = 300,
    ["hp_max"] = 300,
    ["mp_now"] = 300,
    ["mp_max"] = 300,
    ["strength"] = 10,
    ["speed"] = 10,
    ["intelligence"] = 10,
}


local r1d6 = Dice:Create("1d6")
print(r1d6:Roll())
print(r1d6:Roll())

local roll = Dice:Create("1d6 1d8+10")
print(roll:Roll())

function update()
    gRenderer:DrawText2d(0, 0, "Let's make a level class!")
end