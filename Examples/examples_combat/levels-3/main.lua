LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

function NextLevel(level)
    local exponent = 1.5
    local baseXP = 1000
    return math.floor(baseXP * (level ^ exponent))
end

Asset.Run("Dice.lua")
Asset.Run("Stats.lua")
Asset.Run("Actor.lua")

gRenderer = Renderer.Create()


-- Let's design some growth strategies
local stats = {
    ["hp_now"] = 300,
    ["hp_max"] = 300,
    ["mp_now"] = 300,
    ["mp_max"] = 300,
    ["strength"] = 10,
    ["speed"] = 10,
    ["intelligence"] = 10,
}

local Growth =
{
    fast = Dice:Create("3d2"),
    med = Dice:Create("1d3"),
    slow = Dice:Create("1d2")
}

heroDef =
{
    stats = stats, -- starting stats
    statGrowth =
    {
        ["hp_max"] = Dice:Create("4d50+100"),
        ["mp_max"] = Dice:Create("2d50+100"),
        ["strength"] = Growth.fast,
        ["speed"] = Growth.fast,
        ["intelligence"] = Growth.med,
    },
    -- additional actor definition info
}

thiefDef =
{
    stats = stats, -- starting stats
    statGrowth =
    {
        ["hp_max"] = Dice:Create("4d40+100"),
        ["mp_max"] = Dice:Create("2d25+100"),
        ["strength"] = Growth.fast,
        ["speed"] = Growth.fast,
        ["intelligence"] = Growth.slow,
    },
    -- additional actor definition info
}

mageDef =
{
    stats = stats, -- starting stats
    statGrowth =
    {
        ["hp_max"] = Dice:Create("3d40+100"),
        ["mp_max"] = Dice:Create("4d50+100"),
        ["strength"] = Growth.med,
        ["speed"] = Growth.med,
        ["intelligence"] = Growth.fast,
    },
    -- additional actor definition info
}

mage = Actor:Create(mageDef)
thief = Actor:Create(thiefDef)
hero = Actor:Create(heroDef)


function PrintLevelUp(levelup)
    local plu_stats = levelup.stats
    print(string.format("HP:+%d MP:+%d", plu_stats["hp_max"], plu_stats["mp_max"]))
    print(string.format("str:+%d spd:+%d int:+%d", plu_stats["strength"], plu_stats["speed"], plu_stats["intelligence"]))
    print("")
end


function ApplyXP(actor, xp)
    actor:AddXP(xp)
    while(actor:ReadyToLevelUp()) do
        local levelup = actor:CreateLevelUp()
        local levelNumber = actor.mLevel + levelup.level
        print(string.format("Level Up! (Level %d)", levelNumber))
        PrintLevelUp(levelup)
        actor:ApplyLevel(levelup)
    end
end

ApplyXP(hero, 10001)

print("==XP applied==")
print("Level:", hero.mlevel)
print("XP:", hero.mXp)
print("Next Level XP:", hero.mNextLevelXP)

local hStats = hero.mStats

print(string.format("HP:+%d MP:+%d", hStats:Get("hp_max"), hStats:Get("mp_max")))
print(string.format("str:+%d spd:+%d int:+%d", hStats:Get("strength"), hStats:Get("speed"), hStats:Get("intelligence")))


function update()
    gRenderer:DrawText2d(0, 0, "Let's make a level class!")
end
