LoadLibrary("System")
LoadLibrary("Renderer")
LoadLibrary("Asset")

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


function PrintStat(id)
    local base = stats:GetBase(id)
    local full = stats:Get(id)
    local str = string.format("%s>%d:%d", id, base, full)
    print(str)
end


PrintStat("intelligence")     -- 10
PrintStat("hp_now")  -- 300
PrintStat("strength")  -- 10

magic_hat = {
    id = 1,
    modifier = {
        add = {
            ["strength"] = 5
        }
    }
}

stats:AddModifier(magic_hat.id, magic_hat.modifier)
PrintStat("strength")  -- 15


magic_sword = {
    id = 2,
    modifier = {
        add = {
            ["strength"] = 5
        }
    }
}

stats:AddModifier(magic_sword.id, magic_sword.modifier)
PrintStat("strength")  -- 20


spell_bravery = {
    id = "bravery",
    modifier = {
        mult = {
            ["strength"] = 0.1
        }
    }
}

stats:AddModifier(spell_bravery.id, spell_bravery.modifier)
PrintStat("strength")  -- 22


spell_curse = {
    id = "curse",
    modifier = {
        mult = {
            ["strength"] = -0.5
        }
    }
}

stats:AddModifier(spell_curse.id, spell_curse.modifier)
PrintStat("strength")  -- 12 (0.1 - 0.5 == 0.4 mul)

function update()
    gRenderer:DrawText2d(0, 0, "Let's make a stat class!")
end
